using System;

namespace MidtermProject
{
    public enum Category
    {
        student, faculty, staff
    }
    class Person
    {
        private string firstName, lastName, id;
        private Category category;

        public Person(string firstName, string lastName, string id, Category category)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.id = id;
            this.category = category;
        }
        public string GetFirstName()
        {
            return this.firstName;
        }
        public void SetFirstName(string newFirstName)
        {
            firstName = newFirstName;
        }
        public string GetLastName()
        {
            return this.lastName;
        }
        public void SetLastName(string newLastName)
        {
            lastName = newLastName;
        }
        public string GetID()
        {
            return this.id;
        }
        public Category GetCategory()
        {
            return this.category;
        }

        public void GetPersonInfo()
        {
            Console.WriteLine($"Name: {this.firstName} {this.lastName}" + "\n" + $"ID: {this.id}; Type: {this.category}");
        }

    }
}