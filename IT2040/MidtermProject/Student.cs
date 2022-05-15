using System;

namespace MidtermProject
{
    public enum StudentClass
    {
        freshman, sophomore, junior, senior
    }
    class Student : Person
    {
        private string major;
        private int creditHours = 0;
        private StudentClass studentClass;
        public Student(string firstName, string lastName, string id, string major, int creditHours) : base(firstName, lastName, id, Category.student)
        {
            this.major = major;
            this.creditHours = creditHours;
            this.UpdateStudentClass();
        }
        public int GetCreditHours()
        {
            return this.creditHours;
        }
        public string GetMajor()
        {
            return this.major;
        }

        public int UpdateCreditHours(int hours)
        {
            this.creditHours += hours;
            this.UpdateStudentClass();
            return this.creditHours;
        }

        public StudentClass GetStudentClass()
        {
            return this.studentClass;
        }

        public void UpdateStudentClass()
        {
            if (this.creditHours >= 0 && this.creditHours < 30)
            {
                this.studentClass = StudentClass.freshman;
            }
            else if (this.creditHours > 29 && this.creditHours < 60)
            {
                this.studentClass = StudentClass.sophomore;
            }
            else if (this.creditHours > 59 && this.creditHours < 90)
            {
                this.studentClass = StudentClass.junior;
            }
            else if (this.creditHours >= 90)
            {
                this.studentClass = StudentClass.senior;
            }
            else
            {
                throw new ArgumentException("Credit hour cannot be less than 0");
            }
        }
    }
}


