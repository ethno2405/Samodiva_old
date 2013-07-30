using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Security;
using System.Diagnostics;

namespace Samodiva.Class_Library
{
    public class Downloader
    {
        public static Image DownloadImage(string _URL)
        {
            Image _tmpImage = null;
            System.Net.WebResponse _WebResponse = null;
            System.IO.Stream _WebStream = null;
            System.Net.HttpWebRequest _HttpWebRequest;

            try
            {
                _HttpWebRequest = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(_URL);
            }
            catch (SecurityException)
            {
                //TODO: log
                return null;
            }
            catch (UriFormatException)
            {
                //TODO: log
                return null;
            }
            catch (Exception)
            {
                //TODO:log
                return null;
            }

            if (_HttpWebRequest != null)
            {
                _HttpWebRequest.AllowWriteStreamBuffering = true;

                _HttpWebRequest.UserAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)";
                _HttpWebRequest.Referer = "http://www.google.com/";

                _HttpWebRequest.Timeout = 20000;

                _WebResponse = _HttpWebRequest.GetResponse();

                if (_WebResponse != null)
                {
                    _WebStream = _WebResponse.GetResponseStream();
                    if (_WebStream != null)
                    {
                        _tmpImage = Image.FromStream(_WebStream);
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return null;
                }

                _WebStream.Close();
                _WebResponse.Close();
            }
            
            return _tmpImage;
        }
    }
}