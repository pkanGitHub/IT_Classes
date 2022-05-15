## Copy SQL file into Docker Container
1. After downloaded zip and extract the zip.
2. Navigate in your terminal 
   * cd `Docker -> <your folder>`
3. Copy the new sql file into sql-files directory 
   `docker cp <your sql file> mysql-container:/root/sql-files`

## Log into the MySQL Server
1. Log into the server root of the mysql-container
  * `docker exec -it mysql-container bash`

2. Change directory to the sql-files directory
   * `cd ~/sql-files/`

3. Login to the MySQL server from the sql-files directory with username root and password “root” by typing the following
   * `mysql -u root -p`
   * When the password appears, enter the password
     * `root`
     * `source ~/sql-files/<your file's directory>/<your sql file>`
4. `Use <your sql file name>`

5. Start typing queries

----------------------------------------------
+-------------------------+   
| Tables_in_classicmodels |
+-------------------------+
| customers               |
| employees               |
| offices                 |
| orderdetails            |
| orders                  |
| payments                |
| productlines            |
| products                |
+-------------------------+

+---------------------+
| Tables_in_employees |
+---------------------+
| departments         |
| dept_emp            |
| dept_manager        |
| employees           |
| salaries            |
| titles              |
+---------------------+