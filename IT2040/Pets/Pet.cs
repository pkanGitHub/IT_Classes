using System;

namespace Pets
{
    class Pet
    {
        private string type, name, owner;
        private double weight;

        public Pet(string type, string name, string owner, double weight)
        {
            this.type = type;
            this.name = name;
            this.owner = owner;
            this.weight = weight;
        }

        public string GetTypeOfPet()
        {
            return this.type;
        }

        public string GetName()
        {
            return this.name;
        }

        public string GetOwner()
        {
            return this.owner;
        }

        public double GetWeight()
        {
            return this.weight;
        }

        public string GetTag()
        {
            return ($"If lost, call {this.GetOwner()}");
        }
    }
}