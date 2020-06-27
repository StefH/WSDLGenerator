<%@ Page Language="C#" Inherits="System.Web.UI.Page" %>
<%@ Assembly Name="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint.Utilities" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<% Response.ContentType = "text/xml"; %>
<discovery xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.xmlsoap.org/disco/">
  <contractRef ref=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request) + "?wsdl"),Response.Output); %> docRef=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %> xmlns="http://schemas.xmlsoap.org/disco/scl/" />
  <soap address=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %> xmlns:q1="http://tempuri.org/" binding="q1:MyWebService2Soap" xmlns="http://schemas.xmlsoap.org/disco/soap/" />
  <soap address=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %> xmlns:q2="http://tempuri.org/" binding="q2:MyWebService2Soap12" xmlns="http://schemas.xmlsoap.org/disco/soap/" />
</discovery>