using System;
using System.Collections.Generic;
using System.Linq;

namespace GradeConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            int number;
            string letter = "";
            bool continueProgram = true;
            string firstName, lastName;

            Console.WriteLine("What is your first name: ");
            firstName = Console.ReadLine();
            Console.WriteLine("And your last name: ");
            lastName = Console.ReadLine();


            Console.WriteLine($"Hello {firstName} {lastName}. Welcome to the Grade Converter!");
            while (continueProgram)
            {
                Console.WriteLine("Please enter the number of grades you need to convert: ");
                number = int.Parse(Console.ReadLine());

                List<float> gradeList = new List<float>();

                for (int i = 0; i < number; i++)
                {
                    float userVal = getGrade();
                    gradeList.Add(userVal);
                }

                float sum = gradeList.Sum();
                float average = sum / number;

                foreach (float grade in gradeList)
                {
                    letter = convertLetterGrade(grade);
                    Console.WriteLine($"A score of {grade} is a '{letter}' grade");
                }

                string avgLetter = convertLetterGrade(average);

                Console.WriteLine("Grade Statistics");
                Console.WriteLine("------------------");
                Console.WriteLine($"The number of grades: {number}");
                Console.WriteLine($"Average Grade: {average}, which is the letter {avgLetter}");
                Console.WriteLine($"Do you have more grades to convert? (YES or NO): ");

                continueProgram = didUserWantToContinue(Console.ReadLine());
            }
            Console.WriteLine("You entered NO or bad input, the program has ended.");

        }

        static bool didUserWantToContinue(string answer)
        {
            if ("YES" == answer.ToUpper())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        static float getGrade()
        {
            float numberGrade;
            do
            {
                try
                {
                    // prompt user to enter
                    Console.WriteLine("Please enter a grade: ");
                    // get value from console
                    numberGrade = float.Parse(Console.ReadLine());
                    break;
                }
                catch (Exception)
                {
                    Console.WriteLine("There was an error. Please enter a valid grade: ");
                }
            } while (true);
            return numberGrade;
        }

        static string convertLetterGrade(float numberGrade)
        {
            string letter = "";

            if (numberGrade >= 90 && numberGrade <= 100)
            {
                letter = "A";
            }
            else if (numberGrade >= 80 && numberGrade < 90)
            {
                letter = "B";
            }
            else if (numberGrade >= 70 && numberGrade < 80)
            {
                letter = "C";
            }
            else if (numberGrade >= 60 && numberGrade < 70)
            {
                letter = "D";
            }
            else if (numberGrade < 60)
            {
                letter = "F";
            }
            return letter;
        }
    }
}


// Print statistics for the list of grades. You should print the number of grades, and the average grade. The output should look like the following:
// Grade Statistics
// --------------------------
// Number of grades: 10
// Average Grade: 81, which is a B

// Ask the user if they have more grades to convert. If they don't have more grades to convert you should end the program. If they do have more grades to convert you should run the program again.