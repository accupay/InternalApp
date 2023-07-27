using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;

namespace InternalApp
{
  public class Model
  {
    public class AuthLogin_Response
    {
      public string response_code { get; set; }
      public string response_message { get; set; }
      public auth_response data = new auth_response();
    }
    public class auth_response

    {

      public string session_id { get; set; }
      public string token_id { get; set; }
      public string sid { get; set; }
    }



  }

}
 
