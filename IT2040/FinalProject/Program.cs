using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;


namespace FinalProject
{
    class Program
    {
        static void Main(string[] args)
        {
            string playerChoice = "";
            string selectedChoice = "";

            try
            {
                PlayerLogLoader loader = new PlayerLogLoader("player_log.csv");
                playerChoice = StartingMenu(); // check and return the valid option
                selectedChoice = StartingMenuChoice(playerChoice, loader); // choose to start, load, or quit game
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }
        }
        public static void saveNewData(List<Player> playerLog, Player currentPlayer)
        {
            using (var writeCSV = new StreamWriter("player_log.csv"))
            {
                foreach (var player in playerLog)
                {
                    try
                    {
                        // write every player and everyone into the file
                        writeCSV.WriteLine($"{player.Name},{player.NumWins},{player.NumLosses},{player.NumTies}");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine($"Sorry {currentPlayer.Name}, the game cannot be saved. {e.Message}");
                    }
                }
            }
        }
        public static string GetTheName()
        {
            string name = "";
            Console.WriteLine("What is your name?");
            name = Console.ReadLine();
            return name;
        }
        public static string StartingMenu()
        {
            string playerChoice;
            Console.WriteLine("Welcome to Rock, Paper, Scissors!");
            Console.WriteLine("\t1. Start New Game");
            Console.WriteLine("\t2. Load Game");
            Console.WriteLine("\t3. Quit");

            while (true)
            {
                Console.WriteLine("Enter choice: ");
                playerChoice = Console.ReadLine();
                if (playerChoice != "1" && playerChoice != "2" && playerChoice != "3")
                {
                    Console.WriteLine("Not a valid choice, please select one of the following: 1, 2, or 3");
                    continue;
                }
                else
                {
                    break;
                }
            }
            return playerChoice;
        }
        public static string StartingMenuChoice(string playerChoice, PlayerLogLoader loader)
        {
            string name = "";
            // string newName = "";
            List<Player> playerLog = loader.GetPlayerLog();

            if (playerChoice == "1")
            {
                name = GetTheName();
                CheckIfNameExist(name, loader);
                Player newPlayer = new Player(name, 0, 0, 0);
                playerLog.Add(newPlayer);
                GamePlayMenu(playerLog, newPlayer);
            }
            else if (playerChoice == "2")
            {
                Player currentPlayer;
                // if player name exist, load game.
                name = GetTheName();
                currentPlayer = CheckIfNameWasFound(name);

                if (currentPlayer != null)
                {
                    GamePlayMenu(playerLog, currentPlayer);
                }
                else
                {
                    // if player name doesn't exist, give message " {name}, your game could not be found."
                    StartingMenu();
                    StartingMenuChoice(playerChoice, loader);
                }
            }
            else if (playerChoice == "3")
            {
                Environment.Exit(2);
            }
            return playerChoice;
        }
        public static string CheckIfNameExist(string name, PlayerLogLoader loader)
        {
            List<Player> playerLog = loader.GetPlayerLog();
            while (true)
            {
                bool nameMatched = false;
                foreach (var player in playerLog)
                {
                    if (player.Name == name)
                    {
                        Console.WriteLine("The name was taken. Please enter another name.");
                        nameMatched = true;
                    }
                }
                if (nameMatched == false)
                {
                    Console.WriteLine($"Hello {name}. Let's play!");
                    break;
                }
                else
                {
                    name = GetTheName();
                    return name;
                }
            }
            return name;
        }
        public static Player CheckIfNameWasFound(string name)
        {
            List<Player> playerLog = PlayerLogLoader.Load("player_log.csv");
            while (true)
            {
                bool wasFound = false;
                foreach (var player in playerLog)
                {
                    if (player.Name == name)
                    {
                        Console.WriteLine($"Welcome back {name}. Let's play!");
                        wasFound = true;
                        return player;
                    }
                }
                if (wasFound == false)
                {
                    Console.WriteLine($"{name}, your game could not be found.");
                    return null;
                }
            }
        }
        public static void GamePlayMenu(List<Player> playerLog, Player currentPlayer)
        {
            string playerChoice;
            int rndNumber = ComputerChoice();
            Console.WriteLine($"Round: {currentPlayer.RoundNum()}");
            Console.WriteLine("\t1. Rock");
            Console.WriteLine("\t2. Paper");
            Console.WriteLine("\t3. Scissors");

            while (true)
            {
                Console.WriteLine("What will it be?");
                playerChoice = Console.ReadLine();
                if (playerChoice != "1" && playerChoice != "2" && playerChoice != "3")
                {
                    Console.WriteLine("Not a valid choice, please select one of the following: 1, 2, or 3");
                    continue;
                }
                else
                {
                    break;
                }
            }
            if (playerChoice == "1" && rndNumber == 1)
            {
                Console.WriteLine("You chose Rock. The computer chose Rock. You tie!");
                currentPlayer.NumTies++;
            }
            else if (playerChoice == "2" && rndNumber == 2)
            {
                Console.WriteLine("You chose Paper. The computer chose Paper. You tie!");
                currentPlayer.NumTies++;
            }
            else if (playerChoice == "3" && rndNumber == 3)
            {
                Console.WriteLine("You chose Scissors. The computer chose Scissors. You tie!");
                currentPlayer.NumTies++;
            }
            else if (playerChoice == "1" && rndNumber == 2)
            {
                Console.WriteLine("You chose Rock. The computer chose Paper. You lose!");
                currentPlayer.NumLosses++;
            }
            else if (playerChoice == "1" && rndNumber == 3)
            {
                Console.WriteLine("You chose Rock. The computer chose Scissors. You win!");
                currentPlayer.NumWins++;

            }
            else if (playerChoice == "2" && rndNumber == 1)
            {
                Console.WriteLine("You chose Paper. The computer chose Rock. You win!");
                currentPlayer.NumWins++;
            }
            else if (playerChoice == "2" && rndNumber == 3)
            {
                Console.WriteLine("You chose Paper. The computer chose Scissors. You lose!");
                currentPlayer.NumLosses++;
            }
            else if (playerChoice == "3" && rndNumber == 1)
            {
                Console.WriteLine("You chose Scissors. The computer chose Rock. You lose!");
                currentPlayer.NumLosses++;
            }
            else if (playerChoice == "3" && rndNumber == 2)
            {
                Console.WriteLine("You chose Scissors. The computer chose Paper. You win!");
                currentPlayer.NumWins++;
            }
            AfterTheRoundMenu(playerLog, currentPlayer);
        }
        public static int ComputerChoice()
        {
            Random rnd = new Random();
            int randomNum = rnd.Next(1, 4); //create a number between 1 and 4

            return randomNum;
        }
        public static void AfterTheRoundMenu(List<Player> playerLog, Player currentPlayer)
        {

            string afterRoundChoice = "";
            Console.WriteLine("What would you like to do?\n");
            Console.WriteLine("\t1. Play Again");
            Console.WriteLine("\t2. View Player Statistics");
            Console.WriteLine("\t3. View Leaderboard");
            Console.WriteLine("\t4. Quit");

            while (true)
            {
                Console.WriteLine("Enter choice: ");
                afterRoundChoice = Console.ReadLine();
                if (afterRoundChoice != "1" && afterRoundChoice != "2" && afterRoundChoice != "3" && afterRoundChoice != "4")
                {
                    Console.WriteLine("Not a valid choice, please select one of the following: 1, 2, 3, or 4");
                    continue;
                }
                else
                {
                    break;
                }
            }
            if (afterRoundChoice == "1")
            {
                //Play Again
                GamePlayMenu(playerLog, currentPlayer);
            }
            else if (afterRoundChoice == "2")
            {
                ViewStatistic(playerLog, currentPlayer);
            }
            else if (afterRoundChoice == "3")
            {
                //view leaderboard
                Console.WriteLine("Global Game Statistics");
                Console.WriteLine("----------------------");
                Console.WriteLine("----------------------");
                Console.WriteLine("Top 10 Winning Players");
                Console.WriteLine("----------------------");

                var top10WinningPlayers = (from player in playerLog
                                           orderby player.NumWins descending
                                           select player).Take(10);
                foreach (var player in top10WinningPlayers)
                {
                    Console.WriteLine($"{player.Name}: {player.NumWins} wins");
                }

                Console.WriteLine("\n\n-----------------");
                Console.WriteLine("Most Games Played:");
                Console.WriteLine("-----------------");
                var mostGamesPlayed = (from player in playerLog orderby player.GamePlayedNum() descending select player).Take(5);
                foreach (var numPlayed in mostGamesPlayed)
                {
                    Console.WriteLine($"{numPlayed.Name}: {numPlayed.GamePlayedNum()} games played");
                }

                Console.WriteLine("\n\n-----------------");
                float wins = 0, losses = 0;

                foreach (var winLoss in playerLog)
                {
                    wins += winLoss.NumWins;
                    losses += winLoss.NumLosses;
                }
                float overallWinLossRatio = wins / losses;
                Console.WriteLine($"Overall win/Loss Ratio: {Math.Round(overallWinLossRatio, 2)}");
                Console.WriteLine("-----------------");

                Console.WriteLine("\n\n-----------------");

                int totalPlayed = 0;
                foreach (var games in playerLog)
                {
                    totalPlayed += games.GamePlayedNum();
                }
                Console.WriteLine($"Total Games Played: {totalPlayed}");
                Console.WriteLine("-----------------\n\n");
                AfterTheRoundMenu(playerLog, currentPlayer);
            }
            else if (afterRoundChoice == "4")
            {
                saveNewData(playerLog, currentPlayer);
                Console.WriteLine($"{currentPlayer.Name}, your game has been saved.");
                Environment.Exit(2);
            }
        }

        public static void ViewStatistic(List<Player> playerLog, Player currentPlayer)
        {

            Console.WriteLine($"{currentPlayer.Name}, here are your game play statistics...");
            Console.WriteLine($"Wins: {currentPlayer.NumWins}");
            Console.WriteLine($"Losses: {currentPlayer.NumLosses}");
            Console.WriteLine($"Ties: {currentPlayer.NumTies}");
            try
            {
                Console.WriteLine($"Win/Loss Ratio: {Math.Round(currentPlayer.calculateRatio(), 2)}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            AfterTheRoundMenu(playerLog, currentPlayer);
        }
    }
}


