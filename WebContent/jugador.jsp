<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="fifa20.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	 <link rel="stylesheet" href="assets/css/main2.css" />
	<title>Proyecto Web FIFA20</title>
</head>
<%
BDController controladorBD= new BDController();
String colorRat="";
String colorPac="";
String colorSho="";
String colorPas="";
String colorDri="";
String colorDef="";
String colorPhi="";%>

<body class="is-preload">
		<div id="page-wrapper">
		<%
		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">FIFA20</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.html">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="jugadores.jsp">FIFA 19 Jugadores</a></li>
										<li><a href="ligas.jsp">FIFA 19 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 19 Equipos</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>
			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div id="content">

							<!-- Content -->

								<article>
									<header>
										<table style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<tr style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<td width="100" style="background-color:white; border-color: black;text-align:center; margin:0;padding: 0 0em 0em 0em;"><h2></h2></td>
											</tr>
										</table>
									</header>
							<%%>		
							<!-- Grid -->
							<div class="grid-containerGeneral">
							  <div class="c1">
								  <div class="grid-container" style="background-image: url('images/cartas/simple.png');">
									  <div class="A"><%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getRat()); %></div>
									  <div class="B"><%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getPos()); %></div>
									  <div class="C"><img src="images/paises/<%out.print(controladorBD.dameJugador(Integer.parseInt(request.getParameter("cod_jugador"))).getPais());%>.png" height="20px" width="30px"></div>
									  <div class="D"><img src="images/equipos/<%out.print(controladorBD.dameJugador(Integer.parseInt(request.getParameter("cod_jugador"))).getCod_equipo());%>.png" height="30px" width="30px"></div>
									  <div class="E"><img src="images/jugadores/<%out.print(controladorBD.dameJugador(Integer.parseInt(request.getParameter("cod_jugador"))).getCod_jugador());%>.png" height="110px" width="110px"></div>
									  <div class="F"><%out.print(controladorBD.dameJugador(Integer.parseInt(request.getParameter("cod_jugador"))).getNombre()); %></div>
									  <div class="G"><%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getPac()); %> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getDri()); %> DRI<br> <%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getSho()); %> SHO   &nbsp;|&nbsp;&nbsp; <%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getDef()); %> DEF<br><%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getPas()); %> PAS   &nbsp;&nbsp;|&nbsp;&nbsp; <%out.print(controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador"))).getPhy()); %> PHY</div>
									 </div>
							  </div>
							  <div class="b">
							  <% 
							  Carta stats = controladorBD.dameCartaSimple(Integer.parseInt(request.getParameter("cod_jugador")));
							   %>
								  <div class="grid-container2" >
									  <div class="grid-container2">
									 
									  <%
									  if(stats.getPac()>=0 && stats.getPac()<=49){
											colorPac="c2_rojo";
										}else if(stats.getPac()>=50 && stats.getPac()<=69){
											colorPac="c2_naranja";
										}else if(stats.getPac()>=70 && stats.getPac()<=79){
											colorPac="c2_amarillo";
										}else if(stats.getPac()>=80 && stats.getPac()<=89){
											colorPac="c2_verde";
										}else if(stats.getPac()>=90 && stats.getPac()<=99){
											colorPac="c2_verdeoscuro";
											
										}%>
										
										  <div class="a2">PACCING</div>
										  <div class="b2" style="color:#4caf50;"><%out.print(stats.getPac()); %></div>
										  <div style="width:300px;"  class="<%=colorPac%>"></div>
										  
									   
										
										  <div class="d2">SHOOTING</div>
										  <div class="e2" style="color:#4caf50;"><%out.print(stats.getSho()); %></div>
										  <div style="width:300px;" class="<%=colorSho%>"></div>
										
										 
										  
										  <div class="g2">PASSING</div>
										  <div class="h2" style="color:#e9bc0b;"><%out.print(stats.getPas()); %></div>
										  <div class="i2" style="background-color:#e9bc0b; width:280px;"></div>
										  <% 
											
										   %>
										  <div class="j2">DRIBBLING</div>
										  <div class="k2" style="color:#fb8c00;"><%out.print(stats.getDri()); %></div>
										  <div class="l2" style="background-color:#fb8c00; width:120px;"></div>
										  <% 
											
										   %>
										  <div class="m2">DEFENDING</div>
										  <div class="n2" style="color:#4caf50;"><%out.print(stats.getDef()); %></div>
										  <div class="o2" style="background-color:#4caf50; width:240px;"></div>
										  <% 
											
										   %>
										  <div class="p2">PHYSICALITY</div>
										  <div class="q2" style="color:#4caf50;"><%out.print(stats.getPhy()); %></div>
										  <div class="r2" style="background-color:#4caf50; width:200px;"></div>
									</div>
								 </div>
							  </div>
							</div>
							<div class="grid-containerGeneral">
								<div class="c1"  style="padding-left:5px; padding-top:5px;text-align: center;">
									<table style="border-color:white; background-color:white;">
										<tr style="border-color:white; background-color:white;">
											<td style="border-color:white; background-color:white;"><div class="Simple" style="text-align: center;">94</div></td>
											
												<td style="border-color:white; background-color:white;"><div class='Simple' style="text-align: center;">97</div></td>
												<td style="border-color:white; background-color:white;"><div class='Simple' style="text-align: center;">98</div></td>
												<td style="border-color:white; background-color:white;"><div class='Simple' style="text-align: center;">99</div></td>
										</tr>
									</table>
								</div>
								
								
								<div class="b"></div>
							</div>
							</article>

						</div>
					</div>
				</section>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Jugadores</a></li>
									<li><a href="equipos.asp">Listado de Equipos</a></li>
									<li><a href="ligas.asp">Listado de Ligas</a></li>
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>M??s Opciones</h3>
								<ul class="links">
									<li><a href="altaJugador.jsp">Alta Jugador</a></li>
									<li><a href="altaEquipo.jsp">Alta Equipo</a></li>
									<li><a href="altaLiga.jsp">Alta Liga</a></li>
									<li><a href="altaCarta.jsp">Alta Carta</a></li>
									<li><a href="modifiJugador.jsp">Modificar Jugador</a></li>
									<li><a href="modifiEquipo.jsp">Modificar Equipo</a></li>
									<li><a href="modifiLiga.jsp">Modificar Liga</a></li>
									<li><a href="modifiCarta.jsp">Modificar Carta</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Informaci??n</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 19. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>

</html>