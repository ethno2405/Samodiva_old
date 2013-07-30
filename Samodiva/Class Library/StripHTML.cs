using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Samodiva.Class_Library
{
    public static class StripHTML
    {
        public static string Strip(this string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return string.Empty;
            }
            return Regex.Replace(text, @"<(.|\n)*?>", string.Empty);
        }
    }
}