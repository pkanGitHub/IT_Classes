using System;

namespace MidtermProject
{
    class Professor : Person
    {
        private string department, researchArea;

        public Professor(string firstName, string lastName, string id, string department, string researchArea) : base(firstName, lastName, id, Category.faculty)
        {
            this.department = department;
            this.researchArea = researchArea;
        }

        public string GetDepartment()
        {
            return this.department;
        }

        public void SetDepartment(string newDepartment)
        {
            department = newDepartment;
        }

        public string GetResearchArea()
        {
            return this.researchArea;
        }

        public void SetResearchArea(string newResearchArea)
        {
            researchArea = newResearchArea;
        }


    }
}