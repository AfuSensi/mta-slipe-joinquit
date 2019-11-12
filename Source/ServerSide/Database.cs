using System;
using Slipe.Sql;
using Slipe.Server.IO;
using Slipe.Shared.Utilities;
using System.Threading.Tasks;
using ServerSide.GeoInfoHandler;

namespace ServerSide.DatabaseHandling
{
    public class DatabaseHandler
    {
        private Database db;
        private bool UseDatabase = true;
        // Cache days TTL
        private readonly int CacheTTL = 30;
        public DatabaseHandler()
        {
            try
            {
                db = new Database("db/ipcache.db", null);
                db.Exec("CREATE TABLE IF NOT EXISTS cache (ipAddress TEXT NOT NULL UNIQUE PRIMARY KEY, countryCode TEXT, cityName TEXT, regionName TEXT, insertDate INTEGER NOT NULL)");
                // Concat int in string, unsafe i know
                db.Exec($"DELETE FROM cache WHERE `insertDate` <= date('now', '-{CacheTTL} day')");
            }
            catch
            {
                // Should be a debug message (currently broken)
                ChatBox.WriteLine("[slipe-joinquit] Could not initiate cache database!", new Color(255, 0, 0));
                UseDatabase = false;
                return;
            }
            // Should be a debug message (currently broken)
            // ChatBox.WriteLine("Database Initialised");
            
        }

        public void RemoveDatabaseEntries()
        {
            db.Exec("DELETE FROM cache");
        }

        public bool HasConnection()
        {
            return UseDatabase;
        }

        public async Task<GeoInfo> GetGeoInfo(GeoInfo geoInfo)
        {
            // Concat int in string, unsafe i know
            var results = await db.Query($"SELECT `countryCode`, `regionName`, `cityName` FROM cache WHERE `ipAddress` = ? AND `insertDate` >= date('now', '-{CacheTTL} day')", geoInfo.IP);
            if (results.Length > 0)
            {
                var fetchedResults = results[0];

                foreach (var item in fetchedResults)
                {
                    // Implicit ToString
                    string value = item.Value;
                    switch (item.Key)
                    {
                        case "countryCode":
                            // Only set from database when countryCode gets fetched
                            geoInfo.FromDatabase = true;
                            geoInfo.CountryCode = value;
                            break;
                        case "cityName":
                            geoInfo.CityName = value;
                            break;
                        case "regionName":
                            geoInfo.RegionName = value;
                            break;
                    }
                }
            }
            return geoInfo;

        }

        public void SaveCache(GeoInfo geoInfo)
        {
            if (HasConnection() && geoInfo.FromFetch)
            {
                db.Exec("REPLACE INTO cache (ipAddress, countryCode, cityName, regionName, insertDate) VALUES(?,?,?,?,date('now'))", geoInfo.IP, geoInfo.CountryCode, geoInfo.CityName, geoInfo.RegionName);
            }
        }
    }
}