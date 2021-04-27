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
	<title>Proyecto Web FIFA20</title>
</head>
<body class="is-preload">
		<div id="page-wrapper">
		
		 
		<% String cod_liga=request.getParameter("cod_liga"); 
		
		
		BDController controladorBD = new BDController();
		ArrayList<Equipo>equipos=controladorBD.dameEquiposLiga(Integer.parseInt(cod_liga));
		Liga estaLiga = controladorBD.dameLiga(Integer.parseInt(cod_liga));
		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">FIFA19</a></a></h1>

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
											<td width="100" style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;"><img src="images/ligas/<%=estaLiga.getCod_liga()%>.png" width='90'/>
											<h2><%=estaLiga.getNombre()%></h2></td>
											</tr>
										</table>
										
										
										
										
										
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Equipo</th>
											<th width='195' colspan="3"></th>
											<th colspan="19">Plantilla</th>
											
										</tr>
									</thead>
									<tbody>
									<% for (int i=0;i<equipos.size();i++){%>
										<tr>
											<td width='60' rowspan="2"><a href="equipo.jsp?cod_equipo=<%=equipos.get(i).getCod_equipo() %>"><img src="images/equipos/<%=equipos.get(i).getCod_equipo() %>.png" width='60'/></a></td>
											<td width='400' colspan="3" style="padding-left: 15px;"><a href="equipo.jsp?cod_equipo=<%=equipos.get(i).getCod_equipo() %>"><strong><%=equipos.get(i).getNombre() %></strong></a></td>
									<% ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
											   jugadores = controladorBD.dameJugadoresEquipo(equipos.get(i).getCod_equipo());
											   for (int j=0;j<jugadores.size();j++){
											%>			
											<td rowspan="2" width='60' style="text-align: center;"><a href="jugador.jsp?cod_jugador=<%=jugadores.get(j).getCod_jugador() %>"><img src="images/jugadores/<%=jugadores.get(j).getCod_jugador() %>.png" width=40 title='<%=jugadores.get(j).getNombre() %>'/></a></td>
											<%} %>	
																						
										</tr>
										<tr>
										  <td width='45' style="text-align: right;"><a href="liga.jsp?cod_liga=<%=equipos.get(i).getCod_liga() %>"><img src="images/ligas/<%=equipos.get(i).getCod_liga() %>.png" width='30'/></a></td>
										  <td width='50' style="text-align: center;"><img src="images/paises/<%=controladorBD.damePaisLiga(equipos.get(i).getCod_liga()) %>.png" width='30'/></td>
										  <td width='250'></td>
										</tr>
										<%} %>
																				
									</tbody>
									
								</table>
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
								<h3>Más Opciones</h3>
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
								<h3>Solicita Información</h3>
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


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>