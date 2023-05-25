<%@ Page Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true" Inherits="NuevaFecha"  Codebehind="NuevaFecha.aspx.cs" %>

<%@ Register src="~/Controls/ControlFecha.ascx" tagname="ControlFecha" tagprefix="uc1" %>

<%@ Register src="~/controls/EditorFecha.ascx" tagname="EditorFecha" tagprefix="uc2" %>

<%@ Register src="~/Controls/ListadoFechas.ascx" tagname="ListadoFechas" tagprefix="uc3" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="Titulo" >Agregar Novedad<br />
        <uc2:EditorFecha ID="EditorFecha1" runat="server" />
</p>
    <p>
        <asp:Button ID="btCrear" runat="server" style="vertical-align:middle" onclick="btCrear_Click" 
            Text="Agregar" />
&nbsp;<asp:Button ID="btVolver" style="vertical-align:middle" runat="server" onclick="btVolver_Click" Text="Volver" />
&nbsp;<asp:Label ID="Label1" style="vertical-align:middle" runat="server" Font-Bold="True" ForeColor="#CC0000" 
            Text="Algo paso =("></asp:Label>
</p>
</asp:Content>

