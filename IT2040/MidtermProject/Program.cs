using System;

namespace MidtermProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Person person1 = new Person("Truman", "Tiger", "12345", Category.student);
            Console.WriteLine("\n-------Person 1-------------");
            person1.GetPersonInfo();

            Student student1 = new Student("Mickey", "Mouse", "23456", "Information Technology", 87);
            Console.WriteLine("\n-------Student 1-------------");
            student1.GetPersonInfo();
            Console.WriteLine($"Class: {student1.GetStudentClass()} | Credit Hours: {student1.GetCreditHours()}");
            student1.UpdateCreditHours(15);
            Console.WriteLine($"Updated Class: {student1.GetStudentClass()} | Updated Credit Hours: {student1.GetCreditHours()}");

            Professor prof1 = new Professor("Elmer", "Fudd", "56789", "Computer Science", "NLP");
            Console.WriteLine("\n-------Professor 1-------------");

            prof1.GetPersonInfo();
            Console.WriteLine($"Dept: {prof1.GetDepartment()} | Research Area: {prof1.GetResearchArea()}");
            prof1.SetFirstName("Wiley");
            prof1.SetLastName("Coyote");
            prof1.SetResearchArea("Autonomous Systems");
            prof1.SetDepartment("Information Technology");
            Console.WriteLine($"\nNew Name: {prof1.GetFirstName()} {prof1.GetLastName()}");
            Console.WriteLine($"New Dept: {prof1.GetDepartment()} | New Research Area: {prof1.GetResearchArea()}");
        }
    }
}
