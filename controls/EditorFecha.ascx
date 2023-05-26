<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_EditorFecha" Codebehind="EditorFecha.ascx.cs" %>
<style type="text/css">



    .style1
    {
    }



</style>
<table style="font-family: 'Segoe UI Semibold' , verdana, helvetica, sans-serif;
font-size: 15pt;color: rgb(32, 58, 0);">
    <tr>
        <td class="style1">
            Fecha</td>
        <td class="style4">
            Descripción</td>
        <td class="style4" style="text-align: right;">
            <asp:CheckBox ID="chkImportante" runat="server" Text="Importante" 
                ToolTip="Si esta chequeada, la novedad resaltará entre las demás" />
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            </asp:Calendar>
        </td>
        <td class="style4" style="vertical-align: top;" colspan="2">
            <asp:TextBox ID="txtDescripcion" runat="server" Height="197px" Width="460px" CssClass="EditarDescripcion" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <%--    <tr>
        <td class="style3">
            Imágen:
        </td>
        <td class="style4">
            <asp:FileUpload ID="fileUpload" runat="server" />
            &nbsp;<asp:Button ID="btAgregar" runat="server" OnClick="btAgregar_Click" Text="Agregar" />
        </td>
    </tr>--%>
    <tr>
        <td class="style1" colspan="2">
            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
        </td>
        <td class="style1">
            &nbsp;</td>
    </tr>
<%--    <tr>
        <td class="style1">
            <asp:Image ID="Image1" runat="server" />
        </td>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
    </tr>--%>
</table>
