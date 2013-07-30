using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using Samodiva.Data_Source;
using System.Configuration;
using System.Text;

namespace Samodiva.Class_Library
{
    public class XmlGalleryBuilder
    {
        public static void WriteThumbsXML(string FileName)
        {
            PictureCRUD crud = new PictureCRUD();
            List<Picture> pics = crud.GetAllPictures().ToList();
            
            using (XmlTextWriter tw = new XmlTextWriter(HttpContext.Current.Server.MapPath(string.Concat(ConfigurationManager.AppSettings["grid-gallery"], FileName)), null))
            {
                tw.WriteStartElement("images");
                foreach (Picture p in pics)
                {
                    tw.WriteStartElement("photo");
                    tw.WriteAttributeString("image", string.Concat("/Img/Gallery/Thumbnails/", p.URL));

                    tw.WriteRaw("<![CDATA[");
                    tw.WriteStartElement("head");
                    tw.WriteString(p.Title);
                    tw.WriteEndElement();
                    tw.WriteRaw("]]>");
                    tw.WriteEndElement();
                }
                tw.WriteEndElement();
                tw.Close();
            }
        }

        public static void WriteBigXML(string FileName)
        {
            PictureCRUD crud = new PictureCRUD();
            List<Picture> pics = crud.GetAllPictures().ToList();
            using (XmlTextWriter tw = new XmlTextWriter(HttpContext.Current.Server.MapPath(string.Concat(ConfigurationManager.AppSettings["grid-gallery"], FileName)), null))
            {
                tw.WriteStartElement("images");
                foreach (Picture p in pics)
                {
                    tw.WriteStartElement("photo");
                    tw.WriteAttributeString("image", string.Concat("/Img/Gallery/", p.URL));

                    tw.WriteRaw("<![CDATA[");
                    tw.WriteStartElement("head");
                    tw.WriteString(p.Title);
                    tw.WriteEndElement();
                    if (!string.IsNullOrEmpty(p.Description))
                    {
                        tw.WriteStartElement("body");
                        tw.WriteString(p.Description);
                        tw.WriteEndElement();
                    }
                    tw.WriteRaw("]]>");
                    tw.WriteEndElement();
                }
                tw.WriteEndElement();
                tw.Close();
            }
        }

        public static void WriteVideoXML(string Filename)
        {
            VideoCRUD crud = new VideoCRUD();
            List<Video> vids = crud.GetAllVideos().ToList();

            using (XmlTextWriter tw = new XmlTextWriter(HttpContext.Current.Server.MapPath(string.Concat(ConfigurationManager.AppSettings["video-player"], Filename)), Encoding.UTF8))
            {
                tw.WriteStartElement("videos");
                foreach (Video v in vids)
                {
                    tw.WriteStartElement("youtube");
                    tw.WriteAttributeString("media", v.URL);
                    tw.WriteAttributeString("image", string.Concat("http:", v.ThumbURL));
                    tw.WriteAttributeString("autoplay", "false");
                    tw.WriteRaw("<![CDATA[");
                    tw.WriteStartElement("thumbHead");
                    tw.WriteString(v.Title);
                    tw.WriteEndElement();
                    if (!string.IsNullOrEmpty(v.Description))
                    {
                        tw.WriteStartElement("thumbBody");
                        tw.WriteString(v.Description);
                        tw.WriteEndElement();
                    }
                    tw.WriteRaw("]]>");
                    tw.WriteEndElement();
                }
                tw.WriteEndElement();
                tw.Close();
            }
        }
    }
}