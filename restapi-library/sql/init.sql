#root login
# use root user login to mysql
drop database IF EXISTS  restapi;
create database restapi default character set utf8 collate utf8_general_ci;
grant all privileges on restapi.* to restapiuser@localhost identified by 'restapipasswd';
grant all privileges on restapi.* to restapiuser@'%' identified by 'restapipasswd';
use restapi;


# 测试库
#root login
# use root user login to mysql
drop database IF EXISTS  restapi;
create database restapi default character set utf8mb4 collate utf8mb4_unicode_ci;
grant all privileges on restapi.* to restapiuser@localhost identified by 'restapipasswd';
grant all privileges on restapi.* to restapiuser@'%' identified by 'restapipasswd';
use restapi;

SET GLOBAL character_set_client = utf8mb4;
SET GLOBAL character_set_connection = utf8mb4;
SET GLOBAL character_set_database = utf8mb4;
SET GLOBAL character_set_results = utf8mb4;
SET GLOBAL character_set_server = utf8mb4;
SET GLOBAL collation_connection = utf8mb4_general_ci;
SET GLOBAL collation_database = utf8mb4_unicode_ci;
SET GLOBAL collation_server = utf8mb4_unicode_ci;
