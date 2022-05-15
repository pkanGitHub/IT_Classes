using System;

namespace Dog
{
    class Program
    {

        static void Main(string[] args)
        {
            Dog dog1 = new Dog("Orion", "Shawn", 1, Gender.Male);
            dog1.Bark(3);
            Console.WriteLine(dog1.GetTag());
        }
    }
}
