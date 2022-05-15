using System;

namespace Dog
{
    public enum Gender
    {
        Male, Female
    }
    class Dog
    {
        public string name, owner;
        public int age;

        public Gender gender;

        // constructor
        public Dog(string name, string owner, int age, Gender gender)
        {
            this.name = name;
            this.owner = owner;
            this.age = age;
            this.gender = gender;
        }

        public string GetName()
        {
            return this.name;
        }

        public string GetOwner()
        {
            return this.owner;
        }

        public int GetAge()
        {
            return this.age;
        }

        public string GetPronoun()
        {
            if (this.gender == Gender.Male)
            {
                return "he";
            }
            else if (this.gender == Gender.Female)
            {
                return "she";
            }
            else
            {
                return "Invalid gender";
            }
        }

        public string GetPosessivePronoun()
        {
            if (this.gender == Gender.Male)
            {
                return "His";
            }
            else if (this.gender == Gender.Female)
            {
                return "Her";
            }
            else
            {
                return "Invalid gender";
            }
        }

        public void Bark(int count)
        {
            string sound = "";
            for (var i = 0; i < count; i++)
            {
                sound = String.Concat(sound, "Woof!");
            }
            Console.WriteLine(sound);
        }
        public string GetYearOldPrintRight(int age)
        {
            if (age == 1)
            {
                return "year old";
            }
            else
            {
                return "years old";
            }
        }
        public string GetTag()
        {
            return ($"If lost, call {this.GetOwner()}. {this.GetPosessivePronoun()} name is {this.GetName()} and {this.GetPronoun()} is {this.GetAge()} {this.GetYearOldPrintRight(this.GetAge())}.");
        }
    }

}