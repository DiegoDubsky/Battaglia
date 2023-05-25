<%@ Page Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true" Inherits="AdministrarFechas"
    CodeBehind="AdministrarFechas.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p class="Titulo">
        Lista de novedades
        <br />
        <asp:ListBox ID="lstFechas" runat="server" Height="288px" Width="959px" Style="border-radius: 5px;
            box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.53); background-color: rgb(236, 236, 236);border: solid 1px rgba(0, 0, 0, 0.45);font-size: 12pt;">
        </asp:ListBox>
    </p>
    <p>
        <asp:Button ID="btAgregar" runat="server" Text="Agregar"  OnClick="btAgregar_Click" />
        &nbsp;<asp:Button ID="btModificar" runat="server" Text="Modificar"
            OnClick="btModificar_Click" />
        &nbsp;<asp:Button ID="btEliminar" runat="server" Text="Eliminar"  OnClick="btEliminar_Click" />
    </p>
    <p>
        &nbsp;</p>
            <p align="center">
        <asp:Button ID="btReset" runat="server" Text="Reset" onclick="btReset_Click" 
                    ToolTip="Algunos datos del sitio, como las descripciones de archivos, quedan guardadas en sesion. Para recargarlas con los nuevos datos, clickear este boton." />
    </p>
    <p align="center">
        <asp:Button ID="btCerrar" runat="server" Text="Cerrar Sesión Administrador"
            OnClick="btCerrar_Click" />
    </p>
</asp:Content>
