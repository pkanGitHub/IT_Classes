countries:
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | char(2)     | NO   | PRI | NULL    |       |
| country_name | varchar(40) | YES  |     | NULL    |       |
| region_id    | int         | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

departments:
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| department_id   | int         | NO   | PRI | NULL    | auto_increment |
| department_name | varchar(30) | NO   |     | NULL    |                |
| location_id     | int         | YES  | MUL | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

dependents:
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| dependent_id | int         | NO   | PRI | NULL    | auto_increment |
| first_name   | varchar(50) | NO   |     | NULL    |                |
| last_name    | varchar(50) | NO   |     | NULL    |                |
| relationship | varchar(25) | NO   |     | NULL    |                |
| employee_id  | int         | NO   | MUL | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

employees:
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| employee_id   | int          | NO   | PRI | NULL    | auto_increment |
| first_name    | varchar(20)  | YES  |     | NULL    |                |
| last_name     | varchar(25)  | NO   |     | NULL    |                |
| email         | varchar(100) | NO   |     | NULL    |                |
| phone_number  | varchar(20)  | YES  |     | NULL    |                |
| hire_date     | date         | NO   |     | NULL    |                |
| job_id        | int          | NO   | MUL | NULL    |                |
| salary        | decimal(8,2) | NO   |     | NULL    |                |
| manager_id    | int          | YES  | MUL | NULL    |                |
| department_id | int          | YES  | MUL | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

jobs:
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| job_id     | int          | NO   | PRI | NULL    | auto_increment |
| job_title  | varchar(35)  | NO   |     | NULL    |                |
| min_salary | decimal(8,2) | YES  |     | NULL    |                |
| max_salary | decimal(8,2) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

locations:
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| location_id    | int         | NO   | PRI | NULL    | auto_increment |
| street_address | varchar(40) | YES  |     | NULL    |                |
| postal_code    | varchar(12) | YES  |     | NULL    |                |
| city           | varchar(30) | NO   |     | NULL    |                |
| state_province | varchar(25) | YES  |     | NULL    |                |
| country_id     | char(2)     | NO   | MUL | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

regions:
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| region_id   | int         | NO   | PRI | NULL    | auto_increment |
| region_name | varchar(25) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
