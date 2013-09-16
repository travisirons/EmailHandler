<%@ WebHandler Language="C#" Class="MailHandler" %>

using System;
using System.Web;
using System.Net.Mail;

public class MailHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Thank you. Your Message Has Been Sent.");

        string strFrom = context.Request.Form("mailfrom");
        string strTo = context.Request.Form("mailto");
        string strSubject = context.Request.Form("mailsubject");
        string strMessage = context.Request.Form("mailmessage");

        //Send the mail
        MailMessage message = new MailMessage(strFrom, strTo, strSubject, strMessage);
        SmtpClient emailClient = new SmtpClient();
        message.IsBodyHtml = true;
        emailClient.Send(message);

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}