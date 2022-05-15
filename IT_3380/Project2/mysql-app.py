#query ClassicModels database - Example
from sqlite3 import sqlite_version
import mysql.connector

def header(title):
    print(f"\n--------{title}--------\n")

def get_employeesByRegions(mycursor):    
    header("Number of employees in Americas")
    sql_query = "SELECT * FROM EmployeesPerRegion WHERE region_name='Americas';"
    mycursor.execute(sql_query)
    region_result = mycursor.fetchall()
    for record in region_result:
        print(f"Region {record[0]} has {record[1]} employees\n")
    return

def get_mangers(mycursor):
    header("Number of managers in each department")
    sql_query = "SELECT department_name, COUNT(*) AS NumberOfManager FROM managers GROUP BY department_name;"
    mycursor.execute(sql_query)
    manager_result = mycursor.fetchall()
    for record in manager_result:
        print(f"Department {record[0]} have {record[1]} employees\n")
    return

def get_dependentByDepartment(mycursor):
    header("Departments with most dependents")
    sql_query = "SELECT department_name, NumberOfDependents FROM DependentsByDepartment ORDER BY NumberOfDependents DESC LIMIT 2;"
    mycursor.execute(sql_query)
    dependent_result = mycursor.fetchall()
    for record in dependent_result:
        print(f"Department {record[0]} has total of {record[1]} dependents\n")
    return

def get_hiresByYear(mycursor):
    header("Employees hired in 1997")
    sql_query = "SELECT * FROM HiresByYear WHERE Year='1997';" 
    mycursor.execute(sql_query)
    hires_result = mycursor.fetchall()
    for record in hires_result:
        print(f"Hired {record[1]} employees in Year {record[0]}\n")
    return 

def get_salaryByDepartment(mycursor):
    header("Finance total Salaries")
    sql_query = "SELECT * FROM SalaryByDepartment WHERE department_name='Finance';"
    mycursor.execute(sql_query)
    salary_result = mycursor.fetchall()
    for record in salary_result:
        print(f"Department {record[0]} with {record[1]} total salaries\n")
    return

def get_salaryByJobTitle(mycursor):
    header("Job title with highest total salaries")
    sql_query = "SELECT * FROM SalaryByJobTitle ORDER BY TotalSalaries DESC LIMIT 1;"
    mycursor.execute(sql_query)
    salary_result = mycursor.fetchall()
    for record in salary_result:
        print(f"Title {record[0]} has the highest total salaries with ${record[1]}\n")
    return

def get_dependentByEmployee(mycursor):
    header("Employees with no children")
    sql_query = "SELECT * FROM EmployeeDependents WHERE NumberOfDependents=0;"
    mycursor.execute(sql_query)
    dependent_result = mycursor.fetchall()
    for record in dependent_result:
        print(f"Name: {record[0]}\nEmail: {record[1]}\nPhoneNumber: {record[2]}\nDepenedents: {record[3]}\n")
    return

def get_locationByCountry(mycursor):
    print("Country without Location")
    sql_query = "SELECT * FROM CountryLocation WHERE NumberOfLocations=0;"
    mycursor.execute(sql_query)
    location_result = mycursor.fetchall()
    for record in location_result:
        print(f"{record[0]} has {record[1]} locations\n")
    return

def print_menu():
    print("Choose an option")
    print("1. Display # of Employees from Americas")
    print("2. List # of Managers by Departments")
    print("3. Display Departments With Largest Number of Dependent")
    print("4. List # of Employees hired in 1997")
    print("5. Display Salaries by Finance Departments")
    print("6. Display Job Title with Highest Salaries")
    print("7. List Employees without Children")
    print("8. List Countries without locations")
    print("9. Exit Application")
    return

def get_user_choice():
    print_menu()
    choice = int(input("Enter Choice: "))
    return choice


def main():
#create a connector object
    try:
        mydb = mysql.connector.connect(
            host="mysql-container",
            user="root",
            passwd="root",
            database="project2"
        )
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}\nExiting program...")
        quit()

    #create database cursor
    mycursor = mydb.cursor()

    while(True):
        user_choice = get_user_choice()
        if(user_choice == 1):
            get_employeesByRegions(mycursor)
        elif(user_choice == 2):
            get_mangers(mycursor)
        elif(user_choice == 3):
            get_dependentByDepartment(mycursor)
        elif(user_choice == 4):
            get_hiresByYear(mycursor)
        elif(user_choice == 5):
            get_salaryByDepartment(mycursor)
        elif(user_choice == 6):
            get_salaryByJobTitle(mycursor)
        elif(user_choice == 7):
            get_dependentByEmployee(mycursor)
        elif(user_choice == 8):
            get_locationByCountry(mycursor)
        elif(user_choice == 9):
            print("Cya!!!")
            break

main()
    

