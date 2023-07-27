using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace InternalApp
{
  public class Utilities
  {
    public static int ValidatePassword(string pwd)   
    {
      int i = 0;
      Regex regExpwd = new Regex(@"^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#*-_%^!&+=]).*$");
      if (regExpwd.IsMatch(pwd))
        i = 1;
      return i;
    }
    public static string GetMacIP(HttpRequest Request)
    {
      try
      {
        string ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
          ipaddress = Request.ServerVariables["REMOTE_ADDR"];

        return ipaddress;
      }
      catch (Exception ex)
      {
       
        return "NULL";
      }
    }
    public static string GetMacDetails(HttpRequest Request, HttpResponse Response)
    {
      try
      {
        string MacID = VDAL.VCrypto.Encrypt(DateTime.Now.ToString("ddMMMyyhhmmss"));

        if (Request.Cookies["ACCUPAYID"] == null)
        {
          HttpCookie hc = new HttpCookie("ACCUPAYID", MacID);
          if (Request.Url.ToString().Contains("vyabari.in"))
          {
            hc.Domain = ".vyabari.in"; // must start with "."
          }
          hc.Expires = DateTime.Now.AddMonths(8);
          HttpContext.Current.Response.Cookies.Add(hc);
        }
        else
        {
          MacID = Request.Cookies["ACCUPAYID"].Value.ToString();
        }
        return MacID;

        

      }
      catch (Exception ex)
      {
       
        return "NULL";
      }
    }

    public static bool FieldValidation(bool ismandatory, int maxi_length, char[] value, string type, string splchrs = "")
    {
      // Norbert
      int chr_count;

      if (ismandatory)
      {
        if (value.Length < 1)
          // should not be empty
          return false;
      }

      if (value.Length > maxi_length)
        // maximum length exceeded
        return false;

      if (type == "an") // Alpha Numerics
      {
        for (chr_count = 0; chr_count <= value.Length - 1; chr_count++)
        {
          if ((((int)(value[chr_count])) >= 48 & ((int)(value[chr_count])) <= 57 | ((int)(value[chr_count])) >= 65 & ((int)(value[chr_count])) <= 90 | ((int)(value[chr_count])) >= 97 & ((int)(value[chr_count])) <= 122 | splchrs.IndexOf(value[chr_count]) != -1))
          // int _asciiOfA = char.ConvertToUtf32("A", 0);

          {
          }
          else
            // Contains Invalid Characters
            return false;
        }
        return true;
      }

      if (type == "a")  // Only Aphabets and Special characters
      {
        for (chr_count = 0; chr_count <= value.Length - 1; chr_count++)
        {
          if ((((int)(value[chr_count])) >= 65 & ((int)(value[chr_count])) <= 90 | ((int)(value[chr_count])) >= 97 & ((int)(value[chr_count])) <= 122 | splchrs.IndexOf(value[chr_count]) != -1))
          {
          }
          else
            // Contains Invalid Characters
            return false;
        }
        return true;
      }

      if (type == "n")    // Only Numerics
      {
        for (chr_count = 0; chr_count <= value.Length - 1; chr_count++)
        {
          if (((int)(value[chr_count]) >= 48 & (int)(value[chr_count]) <= 57 | splchrs.IndexOf(value[chr_count]) != -1))
          {
          }
          else
            // Contains Invalid Characters
            return false;
        }
        return true;
      }
      return false;
    }

  }
}
