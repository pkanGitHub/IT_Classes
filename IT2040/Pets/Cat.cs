using System;

namespace Pets
{
    class Cat : Pet
    {
        public Cat(string name, string owner, double weight) : base("Cat", name, owner, weight)
        {

        }

        public string Meow(int count)
        {
            string sound = "";
            for (var i = 0; i < count; i++)
            {
                sound = String.Concat(sound, "meow.");
            }
            return sound;
        }
    }
}