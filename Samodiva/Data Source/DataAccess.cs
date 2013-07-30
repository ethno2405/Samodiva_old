using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace Samodiva.Data_Source
{
    public class DataAccess : IDisposable
    {
        protected SamodivaDBEntities context
        {
            get
            {
                string ContextKey = HttpContext.Current.GetHashCode() + System.Threading.Thread.CurrentThread.ManagedThreadId.ToString();

                if (!HttpContext.Current.Items.Contains(ContextKey))
                    HttpContext.Current.Items.Add(ContextKey, new SamodivaDBEntities());
                
                return HttpContext.Current.Items[ContextKey] as SamodivaDBEntities;
            }
        }

        public void LazyLoadingEnabled(bool value)
        {
            context.Configuration.LazyLoadingEnabled = value;
        }


        public void Dispose()
        {
            context.Dispose();
        }
    }
}