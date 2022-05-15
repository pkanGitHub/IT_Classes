from sqlite3 import sqlite_version
import mysql.connector

#Accessory functions
def header(title):
    print(f"\n--------{title}--------\n")

def check_if_input_exist(input): 
    while(True):
        if (len(input) == 0):
            print("Input cannot be empty")
            return True
        else:
            return False

def errCheckSalaryIsNeg(input):
    if (input < 0):
        print("Input cannot be negative number")
        return True
    else:
       return False

def user_choice_check(input):
    if(input < 1):
        print("Choice must be (1-17)")
        return True
    elif(input > 17):
        print("Choice must be (1-17)")
        return True
    else:
        return False

# ********************************
# VIEW DATA
# ********************************

def get_employeesByRegions(mycursor):    
    region = input("Enter region name for specific region or ALL to view all regions: ")
    # check if the input is empty
    check = check_if_input_exist(region)
    if (check == True):
        # if so, prompt user for another input
        get_employeesByRegions(mycursor)
    else:
        #otherwise, operate the rest of the code
        header(f"Number of employees in {region}")
        if(region.upper() == "ALL"):
            sql_query = "SELECT * FROM EmployeesPerRegion"
        else:
            sql_query = (f"SELECT * FROM EmployeesPerRegion WHERE region_name = '{region}'")
        mycursor.execute(sql_query)
        region_result = mycursor.fetchall()
        # check if there's any data exist, 0 if not
        rowCount = len(region_result)
        if (rowCount == 0):
            print(f'There is no region named {region} in the database\n')
        else:
            for record in region_result:
                print(f"Region {record[0]} has {record[1]} employees")
            return

def get_managers(mycursor):
    department = input("Enter department name for specific department or ALL to view all department: ")
    check = check_if_input_exist(department)
    if (check == True):
        get_managers(mycursor)
    else:
        header(f"Number of managers in {department}")
        if(department.upper() == "ALL"):
            sql_query = "SELECT department_name, COUNT(*) AS NumberOfManager FROM managers GROUP BY department_name"
        else:
            sql_query = f"SELECT department_name, COUNT(*) AS NumberOfManager FROM managers WHERE department_name = '{department}' GROUP BY department_name"
        mycursor.execute(sql_query)
        manager_result = mycursor.fetchall()
        rowCount = len(manager_result)

        if (rowCount == 0):
            print(f'There is not a {department} department in the database\n')
        else:
            for record in manager_result:
                print(f"Department {record[0]} have {record[1]} employees")
            return

def get_dependentByDepartment(mycursor):
    department = input("Enter department name for specific department or ALL to view all department: ")
    check = check_if_input_exist(department)
    if (check == True):
        get_dependentByDepartment(mycursor)
    else:
        header(f"Number of Dependent From {department}")
        if(department.upper() == "ALL"):
            sql_query = "SELECT department_name, NumberOfDependents FROM DependentsByDepartment ORDER BY NumberOfDependents DESC"
        else:
            sql_query = f"SELECT department_name, NumberOfDependents FROM DependentsByDepartment WHERE department_name = '{department}'"
        mycursor.execute(sql_query)
        dependent_result = mycursor.fetchall()
        rowCount = len(dependent_result)

        if (rowCount == 0):
            print(f'There is not a {department} department in the database\n')
        else:
            for record in dependent_result:
                print(f"Department {record[0]} has total of {record[1]} dependents")
            return

def get_hiresByYear(mycursor):
    year = input("Enter a year for specific hire year or ALL to view every years: ")
    check = check_if_input_exist(year)
    if (check == True):
        get_managers(mycursor)
    else:
        header(f"Employees hired in {year}")
        if(year.upper() == "ALL"):
            sql_query = "SELECT * FROM HiresByYear" 
        else:
            sql_query = f"SELECT * FROM HiresByYear WHERE Year = '{year}';" 
        mycursor.execute(sql_query)
        hires_result = mycursor.fetchall()
        rowCount = len(hires_result)

        if (rowCount == 0):
            print(f'There is no result for {year} in the database\n')
        else:
            for record in hires_result:
                print(f"Hired {record[1]} employees in Year {record[0]}")
            return 

def get_salaryByDepartment(mycursor):
    department = input("Enter a department for specific department or ALL to see every departments: ")
    check = check_if_input_exist(department)
    if (check == True):
        get_salaryByDepartment(mycursor)
    else:
        header(f"Total Salaries in {department}")
        if(department.upper() == "ALL"):
            sql_query = "SELECT * FROM SalaryByDepartment"
        else:
            sql_query = f"SELECT * FROM SalaryByDepartment WHERE department_name='{department}';"
        mycursor.execute(sql_query)
        salary_result = mycursor.fetchall()
        rowCount = len(salary_result)

        if (rowCount == 0):
            print(f'There is not a {department} department in the database\n')
        else:
            for record in salary_result:
                print(f"Department {record[0]} with {record[1]} total salaries")
            return

def get_salaryByJobTitle(mycursor):
    jobTitle = input("Enter a job tile for specific title or ALL to view all titles: ")
    check = check_if_input_exist(jobTitle)
    if (check == True):
        get_salaryByJobTitle(mycursor)
    else:
        header(f"Total salaries with {jobTitle} title")
        if(jobTitle.upper() == "ALL"):
            sql_query = "SELECT * FROM SalaryByJobTitle ORDER BY TotalSalaries DESC"
        else:
            sql_query = f"SELECT * FROM SalaryByJobTitle WHERE job_title = '{jobTitle}'"
        mycursor.execute(sql_query)
        salary_result = mycursor.fetchall()
        rowCount = len(salary_result)

        if (rowCount == 0):
            print(f'There is not a {jobTitle} title in the database\n')
        else:
            for record in salary_result:
                print(f"{record[0]}'s total salaries is ${record[1]}")
            return

def get_dependentByEmployee(mycursor):
    employee = input("Enter a employee's FULL NAME for specific employee or ALL to view for all employees: ")
    check = check_if_input_exist(employee)
    if (check == True):
        get_dependentByEmployee(mycursor)
    else:
        header(f"{employee} info")
        if(employee.upper() == "ALL"):
            sql_query = "SELECT * FROM EmployeeDependents"
        else:
            sql_query = f"SELECT * FROM EmployeeDependents WHERE EmployeeName = '{employee}'"
        mycursor.execute(sql_query)
        dependent_result = mycursor.fetchall()
        rowCount = len(dependent_result)

        if (rowCount == 0):
            print(f'There is no employee named {employee} in the database, if you think they exist, make sure you input FULL name with correct spacing\n')
        else:
            for record in dependent_result:
                print(f"Name: {record[0]}\nEmail: {record[1]}\nPhoneNumber: {record[2]}\nDepenedents: {record[3]}\n")
            return

def get_locationByCountry(mycursor):
    country = input("Enter a country for specific country or ALL to view all countries: ")
    check = check_if_input_exist(country)
    if (check == True):
        get_locationByCountry(mycursor)
    else:
        header(f"A search for {country}")
        if(country.upper() == "ALL"):
            sql_query = "SELECT * FROM CountryLocation"
        else:
            sql_query = f"SELECT * FROM CountryLocation WHERE country_name='{country}'"
        mycursor.execute(sql_query)
        location_result = mycursor.fetchall()
        rowCount = len(location_result)

        if (rowCount == 0):
            print(f'There is not a country call {country} in the database\n')
        else:
            for record in location_result:
                print(f"{record[0]} has {record[1]} locations")
            return

# ********************************
# ADD DATA
# ********************************
def add_dependent(mycursor):
        try:
            employeeID = int(input("Enter a employee id the child belongs to: "))
        except ValueError:
            print(f'Input MUST be a number')
            return add_dependent(mycursor)

        first_name = getChildFirstName()
        last_name = getChildLastName()
        relationship = getRelationship()

        query = f" INSERT INTO dependents VALUES (NULL, '{first_name}', '{last_name}', '{relationship}', {employeeID})"
        mycursor.execute(query)
        print(f"Dependent {first_name} {last_name} has been successfully created")

# get values for add_dependent function
# =======================================================
def getChildFirstName():
    first_name = input("Enter dependent's first name: ")
    firstNameIsEmpty = check_if_input_exist(first_name)
    if (firstNameIsEmpty == True):
       return getChildFirstName()
    else:
        return first_name
def getChildLastName():
    last_name = input("Enter dependent's last name: ")
    lastNameIsEmpty = check_if_input_exist(last_name)
    if (lastNameIsEmpty == True):
        return getChildLastName()
    else:
        return last_name
def getRelationship():
    relationship = input(f"Enter the relationship between employee and the dependent: ")
    relationIsEmpty = check_if_input_exist(relationship)
    if(relationIsEmpty == True):
        return getRelationship()
    else:
        return relationship
# =======================================================

def add_job(mycursor):
    title = input("Enter job title: ")
    notExist = check_if_input_exist(title)
    if (notExist == True):
        return add_job(mycursor)
    # get salaries
    minSalary = getMinSalary()
    maxSalary = getMaxSalary()
    query = f" INSERT INTO jobs VALUES (NULL, '{title}', {minSalary}, {maxSalary})"
    mycursor.execute(query)
    print(f"{title} has been successfully created")

# get salaries for add_job function
# =======================================================
def getMinSalary():
    try: 
        minSalary = float(input("Enter minimum salary: "))
        isNeg = errCheckSalaryIsNeg(minSalary)
        if(isNeg == True):
            return getMinSalary()
        else:    
            return minSalary
    except ValueError:
        print("Input must be a number")
        return getMinSalary()

def getMaxSalary():
    try: 
        maxSalary = float(input("Enter maximum salary: "))
        isNeg = errCheckSalaryIsNeg(maxSalary)
        if(isNeg == True):
            return getMaxSalary()
        else:
            return maxSalary
    except ValueError:
        print("Input must be a number")
        return getMaxSalary()
# =======================================================
  

# ********************************
# DELETE DATA
# ********************************
def delete_employee(mycursor):
    # add employee to test out
    # INSERT INTO employees VALUE(Null, 'Phyllis', 'Kan', 'pkan@gmail.com', '123.456.7890', '2022-01-17', 19, 12.00, 114, 10);
    try:
        employeeID = int(input("Enter the employee id you want to remove: "))
        query = f" DELETE FROM employees WHERE employee_id = {employeeID}"
        mycursor.execute(query)
        if(mycursor.rowcount == 0):
            print(f"Failed to remove employee, ID {employeeID} doesn't exist")
        else:
            print(f"Employee #{employeeID} was removed successfully")
    except ValueError:
        print(f"Employee ID cannot be a string or empty")
        return delete_employee(mycursor)   

def delete_dependent(mycursor):
    try:
        dependentID = int(input("Enter a dependent ID you want to remove: "))
        query = f" DELETE FROM dependents WHERE dependent_id={dependentID}"
        mycursor.execute(query)
        if(mycursor.rowcount == 0):
            print(f"Failed to remove dependent, ID {dependentID} doesn't exist")
        else:
            print(f"Dependent #{dependentID} was removed successfully")
    except ValueError:
        print("Dependent ID cannot be a string or empty")
        return delete_dependent(mycursor)

# ********************************
# UPDATE DATA
# ********************************
def update_employee_fn(mycursor):
    try:
        employeeID = int(input("Enter the employee ID you are going to update: "))
    except ValueError:
        print("Input must be a number")
        return update_employee_fn(mycursor)
    # get first name
    new_fn = getNewFn()
    query =f" UPDATE employees SET first_name = '{new_fn}' WHERE employee_id = {employeeID}"
    mycursor.execute(query)
    if(mycursor.rowcount == 0):
        print(f"Failed to update employee, ID {employeeID} doesn't exist")
    else:
        print(f"Employee first name updated successfully")

def update_employee_ln(mycursor):
    try:
        employeeID = int(input("Enter the employee's ID: "))
    except ValueError:
        print("Input must be a number")
        return update_employee_ln(mycursor)
    # get last name
    new_ln = getNewLn()
    query =f" UPDATE employees SET last_name = '{new_ln}' WHERE employee_id = '{employeeID}'"
    mycursor.execute(query)
    if(mycursor.rowcount == 0):
        print(f"Failed to update employee, ID {employeeID} doesn't exist")
    else:
        print(f"Employee last name updated successfully")

# get names for updating names functions
# =======================================================
def getNewFn():
    new_fn = input("Enter a new employee first name: ")
    fnInputExist = check_if_input_exist(new_fn)
    if (fnInputExist == True):
        return getNewFn()
    else:
        return new_fn
def getNewLn():
    new_ln = input("Enter a new employee last name: ")
    lnInputExist = check_if_input_exist(new_ln)
    if (lnInputExist == True):
        return getNewLn()
    else:
        return new_ln
# =======================================================

def update_job_minSalary(mycursor):
    try:
        jobID = int(input("Enter the job ID: "))
    except ValueError:
        print("Input must be a number")
        return update_job_minSalary(mycursor)
    # get new minimum salary
    newSalary = getNewMinimum()
    query =f" UPDATE jobs SET min_salary = {newSalary} WHERE job_id = '{jobID}'"
    mycursor.execute(query)
    if(mycursor.rowcount == 0):
        print(f"Failed to update minimum salary, job ID {jobID} doesn't exist")
    else:
        print(f"Job ID {jobID}'s minimum salary updated successfully")


def update_job_maxSalary(mycursor):
    try:
        jobID = int(input("Enter the job ID: "))
    except ValueError:
        print("Input must be a number")
        return update_job_maxSalary(mycursor)
    # get new maximum salary
    newSalary = getNewMaximum()
    query =f" UPDATE jobs SET min_salary = {newSalary} WHERE job_id = '{jobID}'"
    mycursor.execute(query)
    if(mycursor.rowcount == 0):
        print(f"Failed to update maximum salary, job ID {jobID} doesn't exist")
    else:
        print(f"Job ID {jobID}'s maximum salary updated successfully")

# get new salaries to update jobs salary functions
# =======================================================
def getNewMinimum():
    try: 
        newSalary = float(input("Enter the new minimum salary: "))
        isNeg = errCheckSalaryIsNeg(newSalary)
        if(isNeg == True):
            return getNewMinimum()
        else:    
            return newSalary
    except ValueError:
        print("Input must be a number")
        return getNewMinimum()
def getNewMaximum():
    try: 
        newSalary = float(input("Enter the new maximum salary: "))
        isNeg = errCheckSalaryIsNeg(newSalary)
        if(isNeg == True):
            return getNewMaximum()
        else:    
            return newSalary
    except ValueError:
        print("Input must be a number")
        return getNewMaximum()
# =======================================================

def print_menu():
    print("\nChoose an option")
    header('VIEW DATA')
    print("1. View employee count data per region.")
    print("2. View manager count by department")
    print("3. View dependent data per department")
    print("4. View hiring data by year")
    print("5. View Salary data by department")
    print("6. View Salary data by job title")
    print("7. View dependent data by employee")
    print("8. View location data by country")
    # -----------------------------------
    header('ADD DATA')
    print("9. Add a dependent")
    print("10. Add a job")
    # -----------------------------------
    header('DELETE DATA')
    print("11. Delete an employee")
    print("12. Delete a dependent")
    # -----------------------------------
    header('UPDATE DATA')
    print("13. Update employee first name")
    print("14. Update employee last name")
    print("15. Update job minimum salary")
    print("16. Update job maximum salary")
    # -----------------------------------
    header('EXIT')
    print("17. Exit Application")
    return

def get_user_choice():
    print_menu()
    try:
        choice = int(input("Enter Choice: "))
        checkChoice = user_choice_check(choice)
        if(checkChoice == True):
            return get_user_choice()
        else:
            return choice
    except ValueError:
        print(f'Input must be a number(1-17)')
        return get_user_choice()

def create_connector_object():
    mydb = mysql.connector.connect(
        host="mysql-container",
        user="root",
        passwd="root",
        database="project2"
    )
    return mydb

def get_selected_choice():
    mydb = create_connector_object()
    mycursor = mydb.cursor()
    user_choice = get_user_choice()

    if(user_choice == 1):
        get_employeesByRegions(mycursor)
    elif(user_choice == 2):
        get_managers(mycursor)
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
        try:
            add_dependent(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Adding dependent failed, Error: {err}")
    elif(user_choice == 10):
        try: 
            add_job(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Failed to add a job, Error: {err}")
    elif(user_choice == 11):
        try:
            delete_employee(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Removing employee failed, Error: {err}")
    elif(user_choice == 12):
        try:
            delete_dependent(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Removing dependent failed, Error: {err}")
    elif(user_choice == 13):
        try:
            update_employee_fn(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Update employee first name failed, Error: {err}")
    elif(user_choice == 14):
        try:
            update_employee_ln(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Update employee last name failed, Error: {err}")
    elif(user_choice == 15):
        try: 
            update_job_minSalary(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Update minimum salary failed, Error: {err}")
    elif(user_choice == 16):
        try: 
            update_job_maxSalary(mycursor)
            mydb.commit()
        except Exception as err:
            print(f"Update maximum salary failed, Error: {err}")
    elif(user_choice == 17):
        print("Cya!!!")
        exit()


def main():
    try:
        create_connector_object()
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}\nExiting program...")

    while(True):
        get_selected_choice()
        
main()