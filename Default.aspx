<%@ Page Title="" Language="C#" MasterPageFile="~/Marco.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Battaglia.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="controls/ListadoFechas.ascx" TagName="ListadoFechas" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

    </script>
    <script src="js/flexcroll.js" type="text/javascript"></script>
    <link href="css/flexcrollstyles.css" rel="stylesheet" type="text/css" />
  <meta charset="utf-8">  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <link rel="stylesheet" href="./css/simpleSlider.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div ID="VIEJO" style="display:none;">
    <div class="divNovedades" style="text-align: center; width: 430px;">
        <span class="TituloHome">Novedades</span>
    </div>
    <div class="divDestacada" style="text-align: center; width: 455px;">
        <span class="TituloHome">Destacadas</span>
    </div>
    <div class="clear">
    </div>
    <div class="divNovedades">
        <div class="divMarcoHome">
            <div class="flexcroll" style="overflow-y: auto; overflow-x: hidden; height: 350px;
                width: 100%;">
                <uc1:ListadoFechas ID="ListadoFechas1" runat="server" />
            </div>
        </div>
    </div>
    <div class="divDestacada">
        <asp:UpdatePanel runat="server" ID="upd">
            <ContentTemplate>
                <div class="divMarcoHome" id="divDestacada" runat="server" onclick="$('#ContentPlaceHolder1_divDestacada').css('opacity',0.5);__doPostBack('ContentPlaceHolder1_upd','');"
                    style="cursor: pointer; border: solid 3px rgba(119, 119, 119, 0.45);">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
    <div class="clear">
    </div>

        <div class="">

		
		  <!-- Slider -->
		  <div class="simple-slider page-slider" style="width:931px;height:438px">
			<div class="slider-wrapper" >
			  <!-- First slide -->
			  <div class="slider-slide">
				<img src="./destacadas/destacada1.png">
			  </div>

			  <!-- Second slide -->
			  <div class="slider-slide">
				<img src="./destacadas/destacada2.png">
			  </div>

			  <!-- Third slide -->
			  <div class="slider-slide">
				<img src="./destacadas/destacada3.png">
			  </div>

			  <!-- Fourth slide -->
			  <div class="slider-slide">
				<img src="./destacadas/destacada4.png">
			  </div>
			  
			  <!-- Fifth slide -->
			  <div class="slider-slide">
				<img src="./destacadas/destacada5.png">
			  </div>			  
			</div>

			<!--Pagination (Not required)-->
			<div class="slider-pagination"></div>

			<!-- Buttons (Not required) -->
			<div class="slider-btn slider-btn-prev" ></div>
			<div class="slider-btn slider-btn-next"></div> 
		  </div>
		  <!-- /Slider -->		
		
		
        </div>

    <div class="clear">
    </div>
    <div class="copyright" style="position: relative; top: 30px;">
        <!-- Prohibida la utilización de las imagenes sin consentimiento explícito del autor. -->
        <!-- © Todos los derechos reservados, Gabriel Battaglia. -->
    </div>
	
<script src="./js/simpleSlider.min.js"></script>
<script>
  new SimpleSlider('.page-slider', {
    autoplay: true,
    delay: 2000
  });
</script>	
</asp:Content>
