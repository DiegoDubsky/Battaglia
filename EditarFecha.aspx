<%@ Page Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true" Inherits="EditarFecha"  Codebehind="EditarFecha.aspx.cs" %>

<%@ Register src="Controls/ControlFecha.ascx" tagname="ControlFecha" tagprefix="uc1" %>

<%@ Register src="Controls/EditorFecha.ascx" tagname="EditorFecha" tagprefix="uc2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="Titulo" >Modificar Novedad<br />
        <uc2:EditorFecha ID="EditorFecha1" runat="server" />
</p>
    <p>
        <asp:Button ID="btCrear" runat="server" style="vertical-align:middle" onclick="btCrear_Click" 
            Text="Guardar Cambios" />
&nbsp;<asp:Button ID="btVolver" style="vertical-align:middle" runat="server" onclick="btVolver_Click" Text="Volver" />
&nbsp;<asp:Label ID="Label1" style="vertical-align:middle" runat="server" Font-Bold="True" ForeColor="#CC0000" 
            Text="Algo paso =("></asp:Label>
</p>
</asp:Content>

