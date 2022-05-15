using System;

namespace FinalProject
{
    public class Player
    {
        public string Name;
        public int NumWins, NumLosses, NumTies;
        public Player(string name, int numWins, int numLosses, int numTies)
        {
            Name = name;
            NumWins = numWins;
            NumLosses = numLosses;
            NumTies = numTies;
        }
        public int GamePlayedNum()
        {
            return this.NumWins + this.NumLosses + this.NumTies;
        }
        public int RoundNum()
        {
            return this.NumWins + this.NumLosses + this.NumTies + 1;
        }

        public double calculateRatio()
        {
            return (double)this.NumWins / (double)this.NumLosses;
        }
    }
}