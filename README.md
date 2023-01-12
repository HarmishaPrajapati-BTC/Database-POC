# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you want to cover to Use Single Database in Two applications with Granted permissions on table level:

* Prerequisite - Need existing Application runnig with postgresql database

* Create a simple Rails application with postgresql database

* Login into the Existing Application's postgres server

  - psql -h 'host-address-of-existing-server' -U existing-postgres-user -d existing-application-databasename

  - Perform following queries to grant specific permissions:

  1) CREATE ROLE poc_role; #create a role on which you have to give permission
  2) CREATE USER harmisha WITH PASSWORD 'harmisha'; #create user to assign the role which is created on point 1
  3) GRANT poc_role TO harmisha; #grant the created role to User you have created on point 2
  4) GRANT CONNECT ON DATABASE existing-application-databasename TO poc_role; #grant permission to connect to the existing database to the role you have created
  5) GRANT SELECT ON table_name TO poc_role; #grant the select query operations to the role

  - Now login with the user you have created in postgresql
  - psql -h 'host-address-of-existing-server' -U harmisha -d existing-application-databasename
  - Try to select records of table on which you have granted permission of select query
  1) select * from table_name; - will work as we have granted select query
  2) insert into table_name (column_name) values ('TEST DATA'); - gives you error -> ERROR:  permission denied for table table_name
