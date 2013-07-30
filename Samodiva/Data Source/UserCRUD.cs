using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class UserCRUD : DataAccess
    {
        public bool Login(string Username, string Password, string IP)
        {
            User user = (from u in context.Users
                         where u.Username == Username && u.Password == Password
                         select u).FirstOrDefault();
            if (user == null)
                return false;
            user.Last_Login_Date = DateTime.Now;
            user.Last_Login_IP = IP;
            context.SaveChanges();
            return true;
        }
    }
}