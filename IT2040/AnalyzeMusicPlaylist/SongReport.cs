using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace AnalyzeMusicPlaylist
{
    public static class SongReport
    {
        public static string GenerateText(List<Song> songList)
        {
            string report = "Music Playlist Report\n\n";
            if (songList.Count() < 1)
            {
                report += "No data is available.\n";
                return report;
            }

            report += "Songs that receive 200 or more plays: \n";
            var SongsReceived200OrMorePlays = from song in songList where song.Plays >= 200 select song;
            if (SongsReceived200OrMorePlays.Count() > 0)
            {
                // Song class has override, so use Song in place of var
                foreach (Song songPMT200 in SongsReceived200OrMorePlays)
                {
                    report += songPMT200 + "\n";
                    // report += $"Name: {songPMT200.Name}, Artist: {songPMT200.Artist}, Album: {songPMT200.Album}, Genre: {songPMT200.Genre}, Size: {songPMT200.Size}, Time: {songPMT200.Time}, Year: {songPMT200.Year}, Plays: {songPMT200.Plays} \n";
                }
            }
            else
            {
                report += "There is no songs received 200 or more plays\n";
            }

            var NumSongWithGenreAlternative = from song in songList where song.Genre == "Alternative" select song;
            report += $"\nNumber of Alternative Songs: {NumSongWithGenreAlternative.Count()}\n";

            var NumSongWithHipHopRap = from song in songList where song.Genre == "Hip-Hop/Rap" select song;
            report += $"\nNumber of Hip-Hop/Rap songs: {NumSongWithHipHopRap.Count()}\n";

            report += "\nSongs from the album Welcome to the Fishbowl\n";
            var SongsFromAlbumWelcomeToTheFishbowl = from song in songList where song.Album == "Welcome to the Fishbowl" select song;
            if (SongsFromAlbumWelcomeToTheFishbowl.Count() > 0)
            {
                foreach (Song songsFW in SongsFromAlbumWelcomeToTheFishbowl)
                {
                    report += songsFW + "\n";
                    // report += $"Name: {SongsFW.Name}, Artist: {SongsFW.Artist}, Album: {SongsFW.Album}, Genre: {SongsFW.Genre}, Size: {SongsFW.Size}, Time: {SongsFW.Time}, Year: {SongsFW.Year}, Plays: {SongsFW.Plays} \n";
                }
            }
            else
            {
                report += "There is no songs from Welcome to the Fishbowl album\n";
            }

            report += "\nSongs from before 1970: \n";
            var SongsBeforeYear1970 = from song in songList where song.Year < 1970 select song;
            if (SongsBeforeYear1970.Count() > 0)
            {
                foreach (Song songsBY in SongsBeforeYear1970)
                {
                    report += songsBY + "\n";
                    // report += $"Name: {SongsBY.Name}, Artist: {SongsBY.Artist}, Album: {SongsBY.Album}, Genre: {SongsBY.Genre}, Size: {SongsBY.Size}, Time: {SongsBY.Time}, Year: {SongsBY.Year}, Plays: {SongsBY.Plays} \n";
                }
            }
            else
            {
                report += "There is no songs before year 1970\n";
            }

            report += "\nSongs name longer than 85 characters: \n";
            var SongsNameLongerThan85Characters = from song in songList where song.Name.Count() > 85 select song;
            if (SongsNameLongerThan85Characters.Count() > 0)
            {
                foreach (var songsNLT85 in SongsNameLongerThan85Characters)
                {
                    report += $"{songsNLT85.Name}, {songsNLT85.Artist}, {songsNLT85.Album}, {songsNLT85.Genre}, {songsNLT85.Size}, {songsNLT85.Time}, {songsNLT85.Year}, {songsNLT85.Plays} \n";
                }
            }
            else
            {
                report += "There is no songs' name longer than 85 characters\n";
            }

            report += "\nLongest song: \n";
            var LongestSong = from song in songList where song.Time == ((from data in songList select data.Time).Max()) select song;
            if (LongestSong.Count() > 0)
            {
                foreach (Song longestS in LongestSong)
                {
                    report += longestS + "\n";
                    // report += $"Name: {longestS.Name}, Artist: {longestS.Artist}, Album: {longestS.Album}, Genre: {longestS.Genre}, Size: {longestS.Size}, Time: {longestS.Time}, Year: {longestS.Year}, Plays: {longestS.Plays} \n";
                }
            }
            else
            {
                report += "No songs available\n";
            }

            return report;
        }
    }
}