<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Paginador.ascx.cs" Inherits="Battaglia.Controls.Paginador" %>

<asp:HiddenField ID="hfMaxItemsPerPage" runat="server" Value="" />
<asp:HiddenField ID="hfPagina" runat="server" Value="" />
<table align="center">
<tr>
<td width="119px">
    <asp:ImageButton runat="server" ID="hojaAtras" 
        style="vertical-align:middle"  src="../imgs/HojaIzq.png" 
        onclick="hojaAtras_Click" />
    </td>
<td><div id="divContenido" class="Pagina" runat="server"></div></td>
<td width="119px">
    <asp:ImageButton runat="server" ID="hojaAdelante" 
        style="vertical-align:middle"  src="../imgs/HojaDer.png" 
        onclick="hojaAdelante_Click" /></td>
</tr>
</table>
