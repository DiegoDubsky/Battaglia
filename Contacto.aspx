<%@ Page Title="" Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true"
    CodeBehind="Contacto.aspx.cs" Inherits="Battaglia.Contacto" %>

<%@ Register Src="controls/Sendmail.ascx" TagName="Sendmail" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Textbox1
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            text-shadow: 1px 1px 1px rgb(94, 139, 130);
            font-family: "MV Boli" , verdana, helvetica, sans-serif;
            font-size: 12pt;
            text-transform: none;
            width: 388;
            height: 44;
            background-color: transparent;
            background-image: url('Imgs/Textbox1.png');
            padding-left: 10px;
        }
        
        .Textbox2
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: transparent;
            text-shadow: 1px 1px 1px rgb(94, 139, 130);
            font-family: "MV Boli" , verdana, helvetica, sans-serif;
            font-size: 12pt;
            text-transform: none;
            padding: 10px;
            width: 389;
            height: 199; /*background-color:rgb(203,245,245);*/
            background-image: url('Imgs/Textbox2.png');
        }
        
        .parrafoBoli_Upper
        {
            text-shadow: 1px 1px 1px rgb(94, 139, 130);
            font-family: "MV Boli" , verdana, helvetica, sans-serif;
            color: Black;
            text-transform: uppercase;
            font-size: 12pt;
        }
        
        .style1
        {
            border-collapse: collapse;
            margin-top: -70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin: 40px;">
        <tr>
            <td style="width: 50%;">
                <asp:TextBox CssClass="Textbox1" Height="44px" Width="388px" runat="server" ID="txtAsunto"
                    Text="Asunto" />
                <br />
                <asp:TextBox CssClass="Textbox2" runat="server" ID="txtMensaje" Text="Mensaje" Width="379px"
                    Height="189px" TextMode="MultiLine" />
                <br />
                <asp:TextBox CssClass="Textbox1" runat="server" ID="txtMail" Text="E-Mail" Height="40px"
                    Width="388px" />
                <br />
                <asp:Button runat="server" Width="388px" ID="btEnviar" Text="Enviar Mensaje" OnClick="btEnviar_Click"
                    CssClass="BotonEnviar" /><br />
                
                <uc1:Sendmail ID="Sendmail1" runat="server" />
            </td>
            <td class="textoContacto">
                <img src="imgs/FondoContacto.png" style="z-index: 0; display: inline; margin-top: -50px;" />
                <p style="margin-top: -350px;">
                    Para contactarse con Gabriel Battaglia, por cualquier duda, consulta o comentario,
                    llene este formulario y se le responderá al e-mail que ingrese.</p>
                <p>
                    Todas las imágenes se encuentran a la venta; para información acerca de tamaños,
                    costos y demás especificaciones por favor contactarse.</p>
                <p style="height:10px;">
                    También puede encontrarlo en <a target="_blank" href="https://www.facebook.com/gabriel.battaglia.3" class="LinkFacebook">facebook</a>                </p>
            </td>
        </tr>
    </table>
        <asp:Label runat="server" ID="lblMensaje" Style="text-align:center; font-family: 'MV Boli' , verdana, helvetica, sans-serif;" />
</asp:Content>
