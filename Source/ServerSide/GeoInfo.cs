using System;
using Slipe.Server.Peds;
using Slipe.Server.IO;
using System.Linq;
using Slipe.Shared.Utilities;

namespace ServerSide.GeoInfoHandler
{
    public class GeoInfo
    {
        private Player _player;
        public Player player
        {
            get
            {
                return _player;
            }
        }
        public string CountryCode;
        public string CountryName
        {
            get
            {
                return CountryNameHandler.CountryName.Get(CountryCode);
            }
        }
        public string CityName;
        public string RegionName;
        public readonly string IP;
        public readonly bool IsLocalIP;
        public bool FromDatabase = false;
        public bool FromFetch = false;
        public bool UseDebug = false;
        public GeoInfo(Player p)
        {
            _player = p;
            IP = p.IP;
            IsLocalIP = CheckLocalIP();
        }

        private bool CheckLocalIP()
        {

            int[] ipParts = IP.Split(new String[] { "." }, StringSplitOptions.RemoveEmptyEntries).Select(s => int.Parse(s)).ToArray();
            // in private ip range
            if (ipParts[0] == 10 ||
                (ipParts[0] == 192 && ipParts[1] == 168) ||
                (ipParts[0] == 172 && (ipParts[1] >= 16 && ipParts[1] <= 31)))
            {
                return true;
            }
            // IP Address is probably public.
            // This doesn't catch some VPN ranges like OpenVPN and Hamachi.
            return false;
        }

        public void OutputDebug()
        {
            if (UseDebug)
            {
                // Should be in debug, but is currently broken
                Color color = new Color(255, 255, 255);
                ChatBox.WriteLine("  ");
                ChatBox.WriteLine("-----------------------");
                ChatBox.WriteLine("Fetched from:#00FF00 " + (FromDatabase ? "Database" : "Web"), color, true);
                ChatBox.WriteLine("CountryCode: #00FF00" + CountryCode, color, true);
                ChatBox.WriteLine("CountryName: #00FF00" + CountryName, color, true);
                ChatBox.WriteLine("CityName: #00FF00" + CityName, color, true);
                ChatBox.WriteLine("RegionName: #00FF00" + RegionName, color, true);
                ChatBox.WriteLine("-----------------------");
            }
        }
    }
}

