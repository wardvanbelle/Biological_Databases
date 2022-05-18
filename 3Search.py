import requests
import re
import mysql.connector
import PySimpleGUI as sg
from pydov.search.bodemclassificatie import BodemclassificatieSearch
from pydov.util.location import Point, WithinDistance

# function to update the table containing the best trees based on your soiltype
def updateTreesLocation(address):

    # Get the Lambert72 cords based on the address
    url = 'https://loc.geopunt.be/v4/Location?q=' + address

    response = requests.get(url).json()
    LambertX = response['LocationResult'][0]['Location']['X_Lambert72']
    LambertY = response['LocationResult'][0]['Location']['Y_Lambert72']

    # Get the soiltype based on the coördinates
    soilclassification = BodemclassificatieSearch()

    dist = 10
    soilpoints = []
    isSoilType = False
    while len(soilpoints) == 0 or not(isSoilType):
        soilpoints = soilclassification.search(location=WithinDistance(Point(LambertX,LambertY), distance=dist))
        dist += 10
        isSoilType = any([len(soilpoints['bodemtype'][i]) == 3 for i in range(0,len(soilpoints['bodemtype']))])

    soilpoints = soilpoints[[len(soilpoints['bodemtype'][i]) == 3 for i in range(0,len(soilpoints['bodemtype']))]]
    print(f"Found {len(soilpoints)} datapoints at {dist}m.")
    soiltype = soilpoints['bodemtype'].iloc[0]


    # Find best trees based on the soiltype
    texture = soiltype[0]
    drainage = soiltype[1]
    profile = soiltype[2]
    URL = f"https://bobo.inbo.be/rest/treeObjects?_dc=1651758584242&texture={texture}&drainage={drainage}&profile={profile}&substrate=&earthMaterialVariant=&profileDevelopmentVariant=&pH=&trofie=&ecodistrict=&landschapsElement="
    page = requests.get(URL)
    database = page.json()

    # Open the mysql connection and delete the previous records in the treesLocation table
    mydb = mysql.connector.connect(
    host="localhost",
    user="treeKeeper",
    password="saveTheTrees",
    database="treeDB"
    )

    mycursor = mydb.cursor()
    mycursor.execute("DELETE FROM treesLocation")

    # commit the changes to the database
    mydb.commit()

    # Change format of output to a database and input into Trees table# dit werkt nog niet, kijken hoe je dit fixt
    for i in database['data'].keys():
        ranking = int(i[-1])
        for j in range(1,len(database['data'][i])):
            treesJSON = database['data'][i][j]
            treeName = treesJSON['taxonName']
            if ':' in treeName:
                [taxonName, dutchName] = re.split(":\s", treeName)
            else:
                taxonName = treeName

            sql = "INSERT INTO treesLocation (taxonName, ranking) VALUES (%s, %s)"
            mycursor.execute(sql, (taxonName, ranking))

    # commit the changes to the database
    mydb.commit()

def queryTreeDB(animals = [], native=False):

    # define variables
    tables = ""
    conditions = ""

    # create mysql connection
    mydb = mysql.connector.connect(
    host="localhost",
    user="treeKeeper",
    password="saveTheTrees",
    database="treeDB"
    )

    mycursor = mydb.cursor()

    # define needed tables
    if native == True:
        tables += ",nativeTrees"
        conditions += "treesLocation.taxonName = nativeTrees.taxonName"
    
    if animals:
        tables += ",treesForAnimals"

        if conditions:
            conditions += " AND treesLocation.taxonName = treesForAnimals.taxonName"
        else: 
            conditions += "treesLocation.taxonName = treesForAnimals.taxonName"

        for animal in animals:
            conditions += f" AND treesForAnimals.{animal} = 1"

    if animals == [] and native == False:
        query = "SELECT * FROM treesLocation ORDER BY ranking, taxonName"
    else: 
        query = f"SELECT treesLocation.taxonName, treesLocation.ranking FROM treesLocation{tables} WHERE {conditions} ORDER BY treesLocation.ranking, treesLocation.taxonName"

    # execute the query and return the results
    mycursor.execute(query)
    results = mycursor.fetchall()

    return results, query

# Create a simple gui to make it easier to interact with the database.

sg.theme('DarkGreen1')    # Keep things interesting for your users

option_pane = [[sg.Text('TreeDB Search Window')],      
          [sg.Input(key='-ADDRESS-'), sg.Button('Update Address', key='updateAddress')],
          [sg.Text('Current address: None', key='-CurrentAddress-')],
          [sg.Text('Trees should be good for:')],
          [sg.Listbox(values=['horse','bee','butterfly'], select_mode='extended', size=(40, 5), key="-ANIMALS-")],
          [sg.Checkbox('Only native species ', key='-NATIVE-')],     
          [sg.Button('Query', key='queryDB'), sg.Exit()]]  

result_pane = [[sg.Text("Results of query:")],
          [sg.Multiline('', size=(45,15), key='-RESULTS-')]]

layout = [[sg.Column(option_pane),sg.VSeperator(),sg.Column(result_pane)]]    

window = sg.Window('TreeDB Search Window', layout)      

while True:                             # The Event Loop
    event, values = window.read() 
    print(event, values)
    if event == 'updateAddress':
        address = values['-ADDRESS-']
        updateTreesLocation(address)
        window['-ADDRESS-'].update("")
        window['-CurrentAddress-'].update(f"Current address: {address}")
    if event == 'queryDB':
        results, query  = queryTreeDB(animals = values['-ANIMALS-'], native=values['-NATIVE-']) 
        window['-RESULTS-'].update("")
        print(query)
        print(results)
        window['-RESULTS-'].print("Rank\tTaxon Name")
        for result in results:
            window['-RESULTS-'].print(f"  {result[1]}"+"\t"+f"{result[0]}")

    if event == sg.WIN_CLOSED or event == 'Exit':
        break      

window.close()

