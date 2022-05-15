using System;
using System.Collections.Generic;
using System.IO;

namespace FinalProject
{
    public class PlayerLogLoader
    {
        private List<Player> playerLog;
        public PlayerLogLoader(string fileName)
        {
            playerLog = Load(fileName);
        }
        public List<Player> GetPlayerLog()
        {
            return playerLog;
        }

        private static int NumItemsInRow = 4;
        public static List<Player> Load(string playerStatPath)
        {
            List<Player> playerLog = new List<Player>();
            try
            {
                using (var reader = new StreamReader(playerStatPath))
                {
                    int lineNumber = 0;
                    while (!reader.EndOfStream)
                    {
                        var line = reader.ReadLine();
                        lineNumber++;

                        var values = line.Split(',');
                        if (values.Length != NumItemsInRow)
                        {
                            throw new Exception($"Row {lineNumber} contains {values.Length} values. It should contains {NumItemsInRow}.");
                        }

                        try
                        {
                            string name = values[0];
                            int wins = Int32.Parse(values[1]);
                            int losses = Int32.Parse(values[2]);
                            int ties = Int32.Parse(values[3]);

                            Player player = new Player(name, wins, losses, ties);
                            playerLog.Add(player);
                        }
                        catch (FormatException e)
                        {
                            throw new Exception($"Row {lineNumber} contains invalid data. {e.Message}");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception($"Unable to open {playerStatPath} {e.Message}");
            }
            return playerLog;
        }
    }
}
