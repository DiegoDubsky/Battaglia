<%@ WebHandler Language="C#" Class="DestacadaImageHandler" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public class DestacadaImageHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context)
    {
        if (context.Request["File"] == null)
            return;

        string photoPath = HttpContext.Current.Server.MapPath("destacadas") + "//" + context.Request["File"];

        System.Drawing.Image img = new System.Drawing.Bitmap(photoPath);
        FileInfo fileInfo = new FileInfo(photoPath);

        if (img == null)
            return;

        context.Response.ContentType = "image/jpeg";

        //Nos fijamos si la imagen esta cacheada, en tal caso devolvemos el cache
        string cachePath = Path.Combine(HttpRuntime.CodegenDir, fileInfo.Name + ".square.jpg");
        if (File.Exists(cachePath))
        {
            OutputCacheResponse(context, File.GetLastWriteTime(cachePath), fileInfo.Name);
            context.Response.WriteFile(cachePath);
            return;
        }

        ResizeImageSquare(img, context.Response.OutputStream, context, photoPath, cachePath, fileInfo);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private void ResizeImageSquare(System.Drawing.Image photo, Stream stream, HttpContext context, string photoPath, string cachePath, FileInfo fileInfo)
    {
        int width, height;

        int newWidth = 480;
        int newHeight = 400;
        
        if (photo.Width > photo.Height)
        {
            width = newWidth * photo.Width / photo.Height;
            height = newHeight;
        }
        else
        {
            width = newWidth;
            height = newHeight * photo.Height / photo.Width;
        }
        Bitmap target = new Bitmap(newWidth, newHeight);
        using (Graphics graphics = Graphics.FromImage(target))
        {
            graphics.CompositingQuality = CompositingQuality.HighSpeed;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.CompositingMode = CompositingMode.SourceCopy;
            graphics.DrawImage(photo, (newWidth - width) / 2, (newHeight - height) / 2, width, height);
            using (MemoryStream memoryStream = new MemoryStream())
            {
                target.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                OutputCacheResponse(context, File.GetLastWriteTime(photoPath), fileInfo.Name);
                using (FileStream diskCacheStream = new FileStream(cachePath, FileMode.CreateNew))
                {
                    memoryStream.WriteTo(diskCacheStream);
                }
                memoryStream.WriteTo(stream);
            }
        }
    }

    private static void OutputCacheResponse(HttpContext context, DateTime lastModified, string param)
    {
        HttpCachePolicy cachePolicy = context.Response.Cache;
        cachePolicy.SetCacheability(HttpCacheability.Public);
        cachePolicy.VaryByParams["File"] = true;
        cachePolicy.SetOmitVaryStar(true);
        cachePolicy.SetExpires(DateTime.Now + TimeSpan.FromDays(365));
        cachePolicy.SetValidUntilExpires(true);
        cachePolicy.SetLastModified(lastModified);
    }
}