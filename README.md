# Multitenance DB

 A multitenance application is defined to have more than one database.

 In this proof of concept, after creating a new user, this user's provided subdomain is used to create a new schema in the database.
 To access to every pseudo database (in fact it's a different schema in main application database, a feature provided by PostgreSQL),
 a subdomain is used.

 Thus, User 'bill' with subdomain 'crosby' generates crosby.lvh.me URL to access to his own pseudo database
