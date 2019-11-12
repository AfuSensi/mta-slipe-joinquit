using System;
using Slipe.Server.Resources;
using Slipe.Server.Game;
using Slipe.Server.Peds;
using Slipe.Shared.Peds;
using Slipe.Server.IO;
using System.Collections.Generic;
using Slipe.Shared.Utilities;
using ServerSide.DatabaseHandling;
using ServerSide.FetchHandling;
using ServerSide.GeoInfoHandler;

namespace ServerSide.JoinQuit
{
    class JoinQuitHandler
    {
        // Properties
        private DatabaseHandler database;
        private FetchHandler fetch;
        private string ResourceName = Resource.This.Name;
        private bool ShowCountry
        {
            get
            {
                return GetResourceSetting("showCountry");
            }
        }
        private bool ShowRegion
        {
            get
            {
                return GetResourceSetting("showRegion");
            }
        }

        private bool ShowCity
        {
            get
            {
                return GetResourceSetting("showCity");
            }
        }
        
        public JoinQuitHandler()
        {
            // Reset command
            new CommandHandler("jqresetcache", ResetDatabaseCommandHandler, true, false);
            // Database
            database = new DatabaseHandler();
            fetch = new FetchHandler();

            // event subscribe
            Player.OnJoin += JoinHandler;
            foreach (Player player in Player.All)
            {
                HandlePlayerJoined(player);
                player.OnQuit += QuitHandler;
            }
        }

        private bool GetResourceSetting(string settingName)
        {
            // Settings in slipe not implemented
            return true;
        }

        private void SetResourceSetting(string settingName, string settingValue) => Settings.Set(ResourceName + "." + settingName, settingValue);

        private void JoinHandler(Player source, Slipe.Server.Peds.Events.OnJoinEventArgs eventArgs)
        {
            source.OnQuit += QuitHandler;
            HandlePlayerJoined(source);
        }

        private void QuitHandler(Player source, Slipe.Server.Peds.Events.OnQuitEventArgs eventArgs)
        {
            // Kick/Ban currently not working, returns "index is nil"
            string outputString = $"* Quit: {source.Name}#FF6464 ";
            outputString += eventArgs.QuitType switch
            {
                QuitType.Bad_Connection => $"has left the server (Bad Connection)",
                QuitType.Timed_Out => $"has left the server (Timed Out)",
                _ => $"has left the server.",
            };
            ChatBox.WriteLine(outputString, new Color(0xFF6464), true);
            Console.WriteLine(StripColors(outputString));
        }

        

        private void ResetDatabaseCommandHandler(Player source, string command, string[] args)
        {
            if (database.HasConnection())
            {
                database.RemoveDatabaseEntries();
                ChatBox.WriteLine("[slipe-joinquit] Cache database reset", source, new Color(0, 255, 0));
            } else
            {
                ChatBox.WriteLine("[slipe-joinquit] Could not reset cache database", source, new Color(255, 0, 0));
            }
        }

        private async void HandlePlayerJoined(Player player)
        {
            GeoInfo geoInfo = new GeoInfo(player);
            // Fetch player geoloc
            if (database.HasConnection() == true) { geoInfo = await database.GetGeoInfo(geoInfo); }
            if (!geoInfo.FromDatabase) { geoInfo = await fetch.FetchGeoInfo(geoInfo); }
            database.SaveCache(geoInfo);
            geoInfo.OutputDebug();
            OutputPlayerJoined(geoInfo);
        }

        private void OutputPlayerJoined(GeoInfo geoInfo)
        {
            string outputString = $"* Joined: {geoInfo.player.Name}#FF6464";
            string locationString = "";
            // Build valid info list, while honoring settings
            List<string> validInfo = new List<string>();
            if (!String.IsNullOrEmpty(geoInfo.CityName) && ShowCity) { validInfo.Add(geoInfo.CityName); }
            if (!String.IsNullOrEmpty(geoInfo.RegionName) && ShowRegion) { validInfo.Add(geoInfo.RegionName); }
            if (!String.IsNullOrEmpty(geoInfo.CountryName) && ShowCountry) { validInfo.Add(geoInfo.CountryName); }
            if (validInfo.Count > 0)
            {
                string joined = String.Join(", ", validInfo.ToArray());
                locationString = " (" + joined + ")";
            }
            ChatBox.WriteLine(outputString + locationString, new Color(0xFF6464), true);
            Console.WriteLine(StripColors(outputString + locationString));
        }
        private string StripColors(string toStrip)
        {
            // Lua gsub workaround
            /*
            [[
                toStrip = toStrip:gsub('#%x%x%x%x%x%x', '') 
            ]]
            */
            return toStrip;
        }
    }
}
