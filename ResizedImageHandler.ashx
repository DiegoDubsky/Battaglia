<%@ WebHandler Language="C#" Class="ResizedImageHandler" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public class ResizedImageHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context)
    {
        //Limpiar Cache
    //    foreach (string cachedThumbnail in
    //Directory.GetFiles(HttpRuntime.CodegenDir, "*.png", SearchOption.AllDirectories))
    //    {

    //        File.Delete(cachedThumbnail);
    //    }

        if (context.Request["Path"] == null)
            return;

        string photoPath = context.Request["Path"];

        System.Drawing.Image img = new System.Drawing.Bitmap(photoPath);
        FileInfo fileInfo = new FileInfo(photoPath);

        if (img == null)
            return;

        context.Response.ContentType = "image/png";

        //Nos fijamos si la imagen esta cacheada, en tal caso devolvemos el cache
        string cachePath = Path.Combine(HttpRuntime.CodegenDir, fileInfo.Name + ".square.png");
        if (File.Exists(cachePath))
        {
            OutputCacheResponse(context, File.GetLastWriteTime(cachePath), fileInfo.Name);
            context.Response.WriteFile(cachePath);
            return;
        }

        //img.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //ResizeImage(img, context.Response.OutputStream, 180, 128, true);
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
        int _thumbnailSize = 100;
        if (photo.Width > photo.Height)
        {
            width = _thumbnailSize * photo.Width / photo.Height;
            height = _thumbnailSize;
        }
        else
        {
            width = _thumbnailSize;
            height = _thumbnailSize * photo.Height / photo.Width;
        }
        Bitmap target = new Bitmap(_thumbnailSize, _thumbnailSize);
        using (Graphics graphics = Graphics.FromImage(target))
        {
            graphics.CompositingQuality = CompositingQuality.HighSpeed;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.CompositingMode = CompositingMode.SourceCopy;
            graphics.DrawImage(photo, (_thumbnailSize - width) / 2, (_thumbnailSize - height) / 2, width, height);
            using (MemoryStream memoryStream = new MemoryStream())
            {
                target.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
                OutputCacheResponse(context, File.GetLastWriteTime(photoPath), fileInfo.Name);
                using (FileStream diskCacheStream = new FileStream(cachePath, FileMode.CreateNew))
                {
                    memoryStream.WriteTo(diskCacheStream);
                }
                memoryStream.WriteTo(stream);
            }
        }
    }

    private void ResizeImage(System.Drawing.Image OriginalFile, Stream stream, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
    {
        System.Drawing.Image FullsizeImage = OriginalFile;

        // Prevent using images internal thumbnail
        FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
        FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

        if (OnlyResizeIfWider)
        {
            if (FullsizeImage.Width <= NewWidth)
            {
                NewWidth = FullsizeImage.Width;
            }
        }

        int NewHeight = FullsizeImage.Height * NewWidth / FullsizeImage.Width;
        if (NewHeight > MaxHeight)
        {
            // Resize with height instead
            NewWidth = FullsizeImage.Width * MaxHeight / FullsizeImage.Height;
            NewHeight = MaxHeight;
        }
        else
        {
            NewWidth = FullsizeImage.Width  / 2;
            NewHeight = FullsizeImage.Height / 2;
        }
        
        System.Drawing.Image NewImage = FullsizeImage.GetThumbnailImage(NewWidth, NewHeight, null, IntPtr.Zero);

        // Clear handle to original file so that we can overwrite it if necessary
        FullsizeImage.Dispose();

        // Save resized picture
        NewImage.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
    }

    private static void OutputCacheResponse(HttpContext context, DateTime lastModified, string param)
    {
        HttpCachePolicy cachePolicy = context.Response.Cache;
        cachePolicy.SetCacheability(HttpCacheability.Public);
        cachePolicy.VaryByParams["Path"] = true;
        cachePolicy.SetOmitVaryStar(true);
        cachePolicy.SetExpires(DateTime.Now + TimeSpan.FromDays(365));
        cachePolicy.SetValidUntilExpires(true);
        cachePolicy.SetLastModified(lastModified);
    }
}