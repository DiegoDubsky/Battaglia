<%@ Page Title="" Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true"
    CodeBehind="Galeria.aspx.cs" Inherits="Battaglia.Galeria" %>

<%@ Register Src="controls/Galeria.ascx" TagName="Galeria" TagPrefix="uc1" %>
<%@ Register Src="controls/Paginador.ascx" TagName="Paginador" TagPrefix="uc2" %>
<%@ Register Src="controls/Categorias.ascx" TagName="Categorias" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="divGaleria" style="">
        <asp:UpdatePanel runat="server" ID="updGaleria">
            <ContentTemplate>
                <uc3:Categorias ID="ctrCategorias" runat="server" />
                <uc2:Paginador ID="ctrPaginador" runat="server" />
                <div class="clear" />
                <div class="ContenedorGaleria">
                    <uc1:Galeria ID="ctrGaleria" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress runat="server" ID="progreso" AssociatedUpdatePanelID="updGaleria">
            <ProgressTemplate>
                <div style="">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

</asp:Content>
