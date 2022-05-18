# TreeDB
This repository holds the code to create an app that gives you the right trees for your soiltype while also taking into account the animals that live there.
To run the application you should start by downloading the treedb mysql database. This can be done by running the following code in your terminal:
`mysql -u username -p treedb < treedb.sql`. 

After this you should at the user treekeeper and give it access to the database. This can be done by first logging in to your mysql and executing the following code in your prompt:
`CREATE USER 'treeKeeper@localhost' IDENTIFIED WITH BY 'saveTheTrees';`
To grant that user the right permissions execute the following code:
`GRANT ALL PRIVILEGES ON treedb TO 'treeKeeper@localhost';`

After this you should be able to just execute the 3search.py file.
Good luck!
