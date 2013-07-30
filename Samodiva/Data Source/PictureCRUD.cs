using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class PictureCRUD : DataAccess
    {
        public Picture GetPicture(int ID)
        {
            return (from c in context.Pictures
                    where c.Id == ID
                    select c).FirstOrDefault();
        }

        public IEnumerable<Picture> GetAllPictures()
        {
            return (from c in context.Pictures.ToList()
                    orderby c.Date descending
                    select c);
        }

        public IEnumerable<Picture> GetNPictures(int N)
        {
            return (from c in context.Pictures.ToList()
                    orderby c.Date descending
                    select c).Take(N);
        }

        public void SetPicture(Picture picture)
        {
            context.Pictures.Add(picture);
            context.SaveChanges();
        }

        public void EditPicture(Picture picture)
        {
            Picture pic = GetPicture(picture.Id);
            pic = picture;
            context.SaveChanges();
        }

        public void DeletePicture(Picture picture)
        {
            context.Pictures.Remove(picture);
            context.SaveChanges();
        }
    }
}