using System;
using System.Collections.Generic;
using System.IO;

namespace CrimeAnalyzer
{
    public class CrimeDataLoader
    {
        public CrimeDataLoader()
        {

        }

        public List<CrimeStats> GetCrimeStats()
        {
            List<CrimeStats> crimeStatsList = new List<CrimeStats>();
            try
            {
                using (var crimeStatsReader = new StreamReader("CrimeData.csv"))
                {
                    int lineNumber = 0;
                    int numItemsInRow = 11;
                    var line = crimeStatsReader.ReadLine();

                    while (!crimeStatsReader.EndOfStream)
                    {
                        lineNumber++;
                        // read data line by line
                        line = crimeStatsReader.ReadLine();
                        // split the data at the comma to get each value
                        var values = line.Split(',');
                        if (values.Length != numItemsInRow)
                        {
                            throw new Exception($"Row {lineNumber} contains {values.Length} values. It should contain {numItemsInRow}.");
                        }
                        // create crimeStats objects with crimeStats data from the file
                        try
                        {
                            int year = Int32.Parse(values[0]);
                            int population = Int32.Parse(values[1]);
                            int violentCrime = Int32.Parse(values[2]);
                            int murder = Int32.Parse(values[3]);
                            int rape = Int32.Parse(values[4]);
                            int robbery = Int32.Parse(values[5]);
                            int aggravatedAssault = Int32.Parse(values[6]);
                            int propertyCrime = Int32.Parse(values[7]);
                            int burglary = Int32.Parse(values[8]);
                            int theft = Int32.Parse(values[9]);
                            int motorVehicle = Int32.Parse(values[10]);

                            CrimeStats crimeStats = new CrimeStats(year, population, violentCrime, murder, rape, robbery, aggravatedAssault, propertyCrime, burglary, theft, motorVehicle);
                            //store crimeStats object in a list
                            crimeStatsList.Add(crimeStats);
                        }
                        catch (Exception e)
                        {
                            throw new Exception($"Row {lineNumber} contains invalid data. ({e.Message})");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception($"There was an error reading the file {e.Message}");
            }
            return crimeStatsList;
        }
    }
}