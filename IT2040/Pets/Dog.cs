using System;

namespace Pets
{
    class Dog : Pet
    {
        public Dog(string name, string owner, double weight) : base("Dog", name, owner, weight)
        {

        }

        public string Bark(int count)
        {
            string sound = "";
            for (var i = 0; i < count; i++)
            {
                sound = String.Concat(sound, "Woof!");
            }
            return sound;
        }
    }
}