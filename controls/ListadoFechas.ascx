<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Controls_ListadoFechas" Codebehind="ListadoFechas.ascx.cs" %>
<%@ Reference Control="ControlFecha.ascx" %>
<%@ Register Src="FechaA.ascx" TagName="FechaA" TagPrefix="uc1" %>
<asp:Repeater runat="server" ID="rptFechas" OnItemDataBound="rptFechas_ItemDataBound">
    <ItemTemplate>
        <uc1:FechaA ID="controlFecha" runat="server" />
        <div class="clear"></div>
    </ItemTemplate>
</asp:Repeater>

