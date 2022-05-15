using System;
using System.Collections.Generic;
using System.Linq;



namespace AnalyzeMusicPlaylist
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("CrimeAnalyzer <crime_csv_file_path> <report_file_path>");
                Environment.Exit(1);
            }
            string musicDataPath = args[0];
            string reportFilePath = args[1];

            List<Song> songList = null;
            try
            {
                songList = SongLoader.Load(musicDataPath);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }

            var report = SongReport.GenerateText(songList);
            try
            {
                System.IO.File.WriteAllText(reportFilePath, report);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(3);
            }
        }
    }
}
