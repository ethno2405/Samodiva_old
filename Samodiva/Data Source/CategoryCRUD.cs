using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class CategoryCRUD : DataAccess
    {
        public Category GetCategory(int ID)
        {
            return (from c in context.Categories
                    where c.Id == ID
                    select c).FirstOrDefault();
        }

        public IEnumerable<Category> GetAllCategories()
        {
            return (from c in context.Categories.ToList()
                    orderby c.Name ascending
                    select c);
        }

        public IEnumerable<Category> GetNCategories(int N)
        {
            return (from c in context.Categories.ToList()
                    orderby c.Name ascending
                    select c).Take(N);
        }

        public void SetCategory(Category category)
        {
            context.Categories.Add(category);
            context.SaveChanges();
        }

        public void EditCategory(Category category)
        {
            var oldCategory = GetCategory(category.Id);
            oldCategory = category;
            context.SaveChanges();
        }

        public void DeleteCategory(Category category)
        {
            context.Categories.Remove(category);
            context.SaveChanges();
        }
    }
}