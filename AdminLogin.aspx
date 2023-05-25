<%@ Page Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true" Inherits="AdminLogin"  Codebehind="AdminLogin.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="vertical-align:middle;font-family: MV Boli;font-size: 15pt;">
        
        <asp:TextBox ID="TextBox1" TextMode="password" runat="server" style="vertical-align:middle;box-shadow: 0px 0px 10px 4px rgba(0, 43, 12, 0.4);
border-radius: 5px;
font-size: 15pt;
text-align: center;
background-color: rgb(226, 226, 226);"></asp:TextBox>

&nbsp;
        <asp:Button style="vertical-align:middle" ID="Button1" runat="server" 
            Text="Ingresar" onclick="Button1_Click" />

    </p>
</asp:Content>

