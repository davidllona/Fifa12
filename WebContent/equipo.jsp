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
		<%
		String cod_equipo=request.getParameter("cod_equipo"); 	
		BDController controladorBD = new BDController();
		Equipo esteEquipo=controladorBD.dameEquipo(Integer.parseInt(cod_equipo));
		ArrayList<Jugador> jugadores = controladorBD.dameJugadoresEquipo(Integer.parseInt(cod_equipo));
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
											<td width="100" style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;"><img src="images/equipos/<%=esteEquipo.getCod_equipo()%>.png" width='60'/>
											<h2><%=esteEquipo.getNombre()%></h2></td>
											</tr>
										</table>
									</header>
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Plantilla</th>
											<th width='325' colspan="3"></th>
											<th style="text-align: center;">RAT</th>
											<th style="text-align: center;">POS</th>
											<th style="text-align: center;">CARTA</th>
											<th style="text-align: center;">PRECIO</th>
											<th style="text-align: center;">SKI</th>
											<th style="text-align: center;">WF</th>
											<th style="text-align: center;">PAC</th>
											<th style="text-align: center;">SHO</th>
											<th style="text-align: center;">PAS</th>
											<th style="text-align: center;">DRI</th>
											<th style="text-align: center;">DEF</th>
											<th style="text-align: center;">PHI</th>
											<th style="text-align: center;">ALTURA</th>
										</tr>
									</thead>
									<tbody>
									<% for (int i=0;i<jugadores.size();i++){%>
										<tr>
											<td width='60' rowspan="2"><a href="jugador.jsp?cod_jugador=<%=jugadores.get(i).getCod_jugador() %>"><img src="images/jugadores/<%=jugadores.get(i).getCod_jugador() %>.png" width=60 /></a></td>
											<td width='325' colspan="3" style="padding-left: 15px;"><a href="jugador.jsp?cod_jugador=<%=jugadores.get(i).getCod_jugador() %>"><strong><%=jugadores.get(i).getNombre() %></strong></a></td>
											<%if (controladorBD.existeCarta(jugadores.get(i).getCod_jugador())==true){
												Carta cartaSimple = controladorBD.dameCartaSimple(jugadores.get(i).getCod_jugador());
											%>
												<td rowspan="2" width='60' style="text-align: center;"><div class="cuadradito_amarillo" ><%=cartaSimple.getRat() %></div></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%=cartaSimple.getPos() %></td>	
												<td rowspan="2" width='100' style="text-align: center;">SIMPLE</td>	
												<td rowspan="2" width='100' style="text-align: center;"><%=cartaSimple.getPrecio() %></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%=cartaSimple.getPierna_mala() %>*</td>	
												<td rowspan="2" width='60' style="text-align: center;"><%=cartaSimple.getFiligranas() %>*</td>
												<% 
													String clase="cuadradito_verde";
													if (cartaSimple.getPac()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getPac()<90 && cartaSimple.getPac()>79){clase="cuadradito_verde";}
													if (cartaSimple.getPac()<70 && cartaSimple.getPac()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getPac()<60 && cartaSimple.getPac()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getPac()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getPac() %></div></td>	
												<% 
													
													if (cartaSimple.getSho()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getSho()<90 && cartaSimple.getSho()>79){clase="cuadradito_verde";}
													if (cartaSimple.getSho()<70 && cartaSimple.getSho()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getSho()<60 && cartaSimple.getSho()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getSho()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getSho() %></div></td>	
												<% 
													
													if (cartaSimple.getPas()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getPas()<90 && cartaSimple.getPas()>79){clase="cuadradito_verde";}
													if (cartaSimple.getPas()<70 && cartaSimple.getPas()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getPas()<60 && cartaSimple.getPas()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getPas()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getPas() %></div></td>	
												<% 
													
													if (cartaSimple.getDri()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getDri()<90 && cartaSimple.getDri()>79){clase="cuadradito_verde";}
													if (cartaSimple.getDri()<70 && cartaSimple.getDri()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getDri()<60 && cartaSimple.getDri()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getDri()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getDri() %></div></td>	
												<% 
													
													if (cartaSimple.getDef()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getDef()<90 && cartaSimple.getDef()>79){clase="cuadradito_verde";}
													if (cartaSimple.getDef()<70 && cartaSimple.getDef()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getDef()<60 && cartaSimple.getDef()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getDef()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getDef() %></div></td>	
												<% 
													
													if (cartaSimple.getPhy()>=90){clase="cuadradito_verdeoscuro";}
													if (cartaSimple.getPhy()<90 && cartaSimple.getPhy()>79){clase="cuadradito_verde";}
													if (cartaSimple.getPhy()<70 && cartaSimple.getPhy()>59){clase="cuadradito_naranja";}
													if (cartaSimple.getPhy()<60 && cartaSimple.getPhy()>49){clase="cuadradito_amarillo";}
													if (cartaSimple.getPhy()<50){clase="cuadradito_rojo";}
												%>	
												<td rowspan="2" width='60' style="text-align: center;"><div class='<%=clase%>' ><%=cartaSimple.getPhy() %></div></td>
												<td rowspan="2" width='60' style="text-align: center;"><%=jugadores.get(i).getAltura() %>cm</td>
											<%} %>											
										</tr>
										<tr>
										  <td width='45' style="text-align: right;"><a href="equipo.jsp?cod_equipo=<%=jugadores.get(i).getCod_equipo() %>"><img src="images/equipos/<%=jugadores.get(i).getCod_equipo()%>.png" width='30'/></a></td>
										  <td width='50' style="text-align: center;"><img src="images/paises/<%=jugadores.get(i).getPais()%>.png" width='30'/></td>
										  <td width='230'><a href="liga.jsp?cod_liga=<%=controladorBD.dameCodLiga(jugadores.get(i).getCod_equipo()) %>"><img src="images/ligas/<%=controladorBD.dameCodLiga(jugadores.get(i).getCod_equipo()) %>.png" width='30'/></a></td>
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