using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Slipe.Server.IO;
using Slipe.Json;
using ServerSide.GeoInfoHandler;

namespace ServerSide.FetchHandling
{
    public class FetchHandler
    {
        private readonly string FetchURL = "http://www.geoplugin.net/json.gp";
        private HttpClient client;


        public FetchHandler()
        {
            client = new HttpClient();
        }

        public async Task<GeoInfo> FetchGeoInfo(GeoInfo geoInfo)
        {
            // If geoInfo is local ip, fetch without ip query
            string formattedFetchURL = geoInfo.IsLocalIP ? FetchURL : $"{FetchURL}?ip={geoInfo.IP}";
            HttpResponseMessage geoFetchResults = await client.GetAsync(formattedFetchURL);
            if (geoFetchResults.IsSuccessStatusCode == true)
            {
                HttpContent content = geoFetchResults.Content;
                string stringContent = content.ToString();
                Dictionary<string, dynamic> parsedJson = Json.Deserialize<Dictionary<string, dynamic>>(stringContent);
                bool jsonStatusCodeOk = (parsedJson.ContainsKey("geoplugin_status") && parsedJson["geoplugin_status"] != 404) ? true : false;
                if (jsonStatusCodeOk)
                {
                    foreach (var item in parsedJson)
                    {
                        switch (item.Key)
                        {
                            case "geoplugin_countryCode":
                                // Only set from fetch when we have a country code
                                geoInfo.FromFetch = true;
                                geoInfo.CountryCode = item.Value;
                                break;
                            case "geoplugin_city":
                                geoInfo.CityName = item.Value;
                                break;
                            case "geoplugin_region":
                                geoInfo.RegionName = item.Value;
                                break;
                        }
                    }
                }
                else
                {
                    // Should be a debug message (currently broken)
                    ChatBox.WriteLine("Status 404");
                }
            }
            else
            {
                // Should be a debug message (currently broken)
                ChatBox.WriteLine("Could not fetch geo data. Error code: " + geoFetchResults.StatusCode.ToString());
            }
            return geoInfo;
        }
    }
}