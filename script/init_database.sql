/*
======================================================
Create databases and schemas
======================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	if the database exists, it is dropped and recreated. 
	Additionally ,the script sets up three schemas within the database:'Bronze','Silver' and 'Gold'

*/

use master;
go

--checking the existing of database
if exists(select 1 from sys.databases where name='DataWarehouse')
begin
	drop database DataWarehouse
	print 'The database exists'
end
else
	begin
	print 'The database dont exists'
end
go

--create the database
create database DataWarehouse;
go

use datawarehouse;
go

--create the schemas
create schema Bronze;
go 

create schema Silver;
go 

create schema Gold;
go
