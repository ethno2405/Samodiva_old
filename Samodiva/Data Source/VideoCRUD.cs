using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class VideoCRUD : DataAccess
    {
        public IEnumerable<Video> GetAllVideos()
        {
            return (from c in context.Videos.ToList()
                    orderby c.Date descending
                    select c);
        }

        public IEnumerable<Video> GetNVideos(int N)
        {
            return (from c in context.Videos.ToList()
                    orderby c.Date descending
                    select c).Take(N);
        }

        public Video GetVideo(int ID)
        {
            return (from c in context.Videos
                    where c.Id == ID
                    select c).FirstOrDefault();
        }

        public void SetVideo(Video video)
        {
            context.Videos.Add(video);
            context.SaveChanges();
        }

        public void EditVideo(Video video)
        {
            Video vid = GetVideo(video.Id);
            vid = video;
            context.SaveChanges();
        }

        public void DeleteVideo(int ID)
        {
            context.Videos.Remove(GetVideo(ID));
            context.SaveChanges();
        }

        public void DeleteVideo(Video video)
        {
            context.Videos.Remove(video);
            context.SaveChanges();
        }
    }
}