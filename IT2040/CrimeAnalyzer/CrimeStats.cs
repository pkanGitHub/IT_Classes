using System;

namespace CrimeAnalyzer
{
    public class CrimeStats
    {
        public int year, population, violentCrime, murder, rape, robbery, aggravatedAssault, propertyCrime, burglary, theft, motorVehicle;

        public CrimeStats(int year, int population, int violentCrime, int murder, int rape, int robbery, int aggravatedAssault, int propertyCrime, int burglary, int theft, int motorVehicle)
        {
            this.year = year;
            this.population = population;
            this.violentCrime = violentCrime;
            this.murder = murder;
            this.rape = rape;
            this.robbery = robbery;
            this.aggravatedAssault = aggravatedAssault;
            this.propertyCrime = propertyCrime;
            this.burglary = burglary;
            this.theft = theft;
            this.motorVehicle = motorVehicle;
        }
        public int GetYear()
        {
            return this.year;
        }
        public int GetPopulation()
        {
            return this.population;
        }
        public int GetViolentCrime()
        {
            return this.violentCrime;
        }
        public int GetMurder()
        {
            return this.murder;
        }
        public int GetRape()
        {
            return this.rape;
        }
        public int GetRobbery()
        {
            return this.robbery;
        }
        public int GetAggravatedAssault()
        {
            return this.aggravatedAssault;
        }
        public int GetPropertyCrime()
        {
            return this.propertyCrime;
        }
        public int GetBurglary()
        {
            return this.burglary;
        }
        public int GetTheft()
        {
            return this.theft;
        }
        public int GetMotorVehicle()
        {
            return this.motorVehicle;
        }
    }
}