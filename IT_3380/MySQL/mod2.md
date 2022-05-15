agents:
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| AGENT_CODE   | char(6)       | NO   | PRI | NULL    |       |
| AGENT_NAME   | char(40)      | YES  |     | NULL    |       |
| WORKING_AREA | char(35)      | YES  |     | NULL    |       |
| COMMISSION   | decimal(10,2) | YES  |     | NULL    |       |
| PHONE_NO     | char(15)      | YES  |     | NULL    |       |
| COUNTRY      | varchar(25)   | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+

customer:
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| CUST_CODE       | varchar(6)    | NO   | PRI | NULL    |       |
| CUST_NAME       | varchar(40)   | NO   |     | NULL    |       |
| CUST_CITY       | char(35)      | YES  |     | NULL    |       |
| WORKING_AREA    | varchar(35)   | NO   |     | NULL    |       |
| CUST_COUNTRY    | varchar(20)   | NO   |     | NULL    |       |
| GRADE           | decimal(10,0) | YES  |     | NULL    |       |
| OPENING_AMT     | decimal(12,2) | NO   |     | NULL    |       |
| RECEIVE_AMT     | decimal(12,2) | NO   |     | NULL    |       |
| PAYMENT_AMT     | decimal(12,2) | NO   |     | NULL    |       |
| OUTSTANDING_AMT | decimal(12,2) | NO   |     | NULL    |       |
| PHONE_NO        | varchar(17)   | NO   |     | NULL    |       |
| AGENT_CODE      | char(6)       | NO   |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+

orders:
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ORD_NUM         | decimal(6,0)  | NO   | PRI | NULL    |       |
| ORD_AMOUNT      | decimal(12,2) | NO   |     | NULL    |       |
| ADVANCE_AMOUNT  | decimal(12,2) | NO   |     | NULL    |       |
| ORD_DATE        | date          | NO   |     | NULL    |       |
| CUST_CODE       | varchar(6)    | NO   |     | NULL    |       |
| AGENT_CODE      | char(6)       | NO   |     | NULL    |       |
| ORD_DESCRIPTION | varchar(60)   | NO   |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+