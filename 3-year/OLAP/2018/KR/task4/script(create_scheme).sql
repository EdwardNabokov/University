-- Create the user 
create user TASK4
  identified by "TASK4"
  default tablespace USERS
  temporary tablespace TEMP
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant connect to TASK4;
grant resource to TASK4;
-- Grant/Revoke system privileges 
--grant unlimited tablespace to TASK3;
