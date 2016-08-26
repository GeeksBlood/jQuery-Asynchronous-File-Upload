<%@ WebHandler Language="C#" Class="imageupload" %>

using System;
using System.Web;
using System.IO;

public class imageupload : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        if (context.Request.Files.Count > 0)
        {
            string path =context.Server.MapPath("/Handler/uploadIMG/");

            var file = context.Request.Files[0];
            string fileName;
            fileName = file.FileName;
            string strFileName = fileName;
            String guid = Guid.NewGuid().ToString();
            string fileext = Path.GetExtension(strFileName).ToLower();
            strFileName = guid + fileext;
            fileName = strFileName;
            

                fileName = Path.Combine(path, fileName);
                file.SaveAs(fileName);

                string msg = "{";
                msg += string.Format("error:'{0}',\n", string.Empty);
                msg += string.Format("msg:'{0}'\n", strFileName);
                msg += "}";
                context.Response.Write(msg);

        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}