using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class NewsCRUD : DataAccess
    {
        public IEnumerable<News> GetNews()
        {
            return (from c in context.News
                    orderby c.Date descending
                    select c);
        }

        public News GetNews(int ID)
        {
            return (from c in context.News
                    where c.id == ID
                    select c).FirstOrDefault();
        }

        public IEnumerable<News> GetNNews(int N)
        {
            return (from c in context.News.ToList()
                    orderby c.Date descending
                    select c).Take(N);
        }

        public void SetNews(Data_Source.News news)
        {
            context.News.Add(news);
            context.SaveChanges();
        }

        public void EditNews(Data_Source.News news)
        {
            News n = GetNews(news.id);
            n = news;
            context.SaveChanges();
        }

        public void DeleteNews(int ID)
        {
            context.News.Remove(GetNews(ID));
            context.SaveChanges();
        }
    }
}