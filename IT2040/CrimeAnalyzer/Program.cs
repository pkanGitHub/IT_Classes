using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;

namespace CrimeAnalyzer
{
    class Program
    {

        static void Main(string[] args)
        {
            // string fileName = args[0];
            // string report = args[1];

            CrimeDataLoader dataLoader = new CrimeDataLoader();
            List<CrimeStats> crimeStatsList = dataLoader.GetCrimeStats();

            var years = from crimeStats in crimeStatsList select crimeStats.year;
            Console.WriteLine($"years range from {years.Min()} to {years.Max()}");
            Console.WriteLine($"{years.ToArray().Length} years are included");

            var yearsLessMurder = from crimStats in crimeStatsList where crimStats.GetMurder() < 15000 select crimStats;
            String yearString = "";
            foreach (var yearLM in yearsLessMurder)
            {
                yearString = yearString + yearLM.GetYear() + ", ";
            }
            Console.WriteLine($"{yearString.Substring(0, yearString.Length - 2)} has less than 15000 murders.");


            var yearsMoreRobbery = from crimeStats in crimeStatsList where crimeStats.GetRobbery() > 500000 select crimeStats;
            String yearStringRob = "";
            foreach (var yearMR in yearsMoreRobbery)
            {
                yearStringRob = yearStringRob + yearMR.GetYear() + " = " + yearMR.GetRobbery() + ", ";
            }
            Console.WriteLine($"Robberies per year > 500000: {yearStringRob.Substring(0, yearStringRob.Length - 2)}");

            var violentCrimePerCapitaRate = (from crimeStats in crimeStatsList where crimeStats.GetYear() == 2010 select new { ViolentCrime = crimeStats.GetViolentCrime(), Population = crimeStats.GetPopulation() }).ToList();
            Console.WriteLine($"The crime per capita rate for 2010 is: {(double)violentCrimePerCapitaRate.First().ViolentCrime / violentCrimePerCapitaRate.First().Population}");


            var avgMurdersAllYears = (from crimeStats in crimeStatsList select crimeStats.GetMurder()).Average();
            Console.WriteLine($"The average number of murders across all years is: {avgMurdersAllYears}");

            var avgMurdersYears94To97 = (from crimeStats in crimeStatsList where crimeStats.GetYear() >= 1994 && crimeStats.GetYear() <= 1997 select crimeStats.GetMurder()).Average();
            Console.WriteLine($"The average numbers of murders from year 1994 to 1997 is: {avgMurdersYears94To97}");

            var avgMurdersYears10To13 = (from crimeStats in crimeStatsList where crimeStats.GetYear() >= 2010 && crimeStats.GetYear() <= 2013 select crimeStats.GetMurder()).Average();
            Console.WriteLine($"The average numbers of murders from year 2010 to 2013 is: {avgMurdersYears10To13}");

            var minTheftYear99To04 = (from crimeStats in crimeStatsList where crimeStats.GetYear() >= 1999 && crimeStats.GetYear() <= 2004 select crimeStats.GetTheft()).Min();
            Console.WriteLine($"The minimum number of theft from 1999 to 2004 is: {minTheftYear99To04}");

            var maxTheftYear99To04 = (from crimeStats in crimeStatsList where crimeStats.GetYear() >= 1999 && crimeStats.GetYear() <= 2004 select crimeStats.GetTheft()).Max();
            Console.WriteLine($"The maximum number of theft from 1999 to 2004 is: {maxTheftYear99To04}");

            // var maxTheftYear = (from crimeStats in crimeStatsList select new { Theft = crimeStats.GetTheft(), Year = crimeStats.GetYear() });
            var maxTheftYear = (from crimeStats in crimeStatsList orderby crimeStats.GetTheft() descending select crimeStats.GetYear());
            Console.WriteLine($"In year {maxTheftYear.First()} has highest number of motor vehicle theft");
        }
    }
}

//(done)What is the range of years included in the data?
//(done)How many years of data are included?
//(done) What years is the number of murders per year less than 15000?
//(done)What are the years and associated robberies per year for years where the number of robberies is greater than 500000?
// What is the violent crime per capita rate for 2010? Per capita rate is the number of violent crimes in a year divided by the size of the population that year.
// (done)What is the average number of murders per year across all years?
// (done)What is the average number of murders per year for 1994 to 1997?
// (done)What is the average number of murders per year for 2010 to 2013?
// (done)What is the minimum number of thefts per year for 1999 to 2004?
// (done)What is the maximum number of thefts per year for 1999 to 2004?
// (done)What year had the highest number of motor vehicle thefts?