<%@ Page Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true" Inherits="Fechas" Codebehind="Fechas.aspx.cs" %>

<%@ Register Src="~/Controls/ListadoFechas.ascx" TagName="ListadoFechas" TagPrefix="uc1" %>
<%@ Reference Control="~/Controls/ControlFecha.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div  class="flecha" style="margin-left: 600px">
            <asp:ImageButton style="cursor:default" ID="Image1" runat="server" ImageUrl="~/Imgs/Flecha.png" 
                onclick="Image1_Click" />
        </div>
        <table align="center">
            <tr>
                <td>
                    <uc1:ListadoFechas ID="ListadoFechas1" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>