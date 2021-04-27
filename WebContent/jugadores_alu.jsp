<%@ page language="java" contentType="text/html;charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="fifa20.*" %>
<%@ page import="fifa20.BDController" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
</head>
<%
BDController controladorBD=new BDController();
String nombre="SIMPLE";
String nombreJug="";
String nombre_carta="";
int altura=0;
int cod_jugador=0;
int rat=0;
String pos="";
int precio=0;
int pac=0;
int sho=0;
int pas=0;
int dri=0;
int def=0;
int phy=0;
int pierna_mala=0;
int filigranas=0;


%>
<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA19</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">Opci�n 1</a></li>
										
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Opci�n 1</a>
											<ul>
												<li><a href="altajugador.jsp">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 2</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 3</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 4</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opci�n 1</a></li>
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
										<table >
											<tr style="border:0px;" >	
												<td style="background-color: white;"><h2>Jugadores</h2></td><td style="text-align: right;background-color: white;""></td>
											</tr>
										</table>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
										
											<th>Nombre</th>
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
									
										
                                           <tr>
											<% 
											   for(int i=0;i<controladorBD.dameJugadores().size();i++){     
												   nombreJug=controladorBD.dameJugadores().get(i).getNombre();
												   altura=controladorBD.dameJugadores().get(i).getAltura();
												   cod_jugador=controladorBD.dameJugadores().get(i).getCod_jugador();
												   for(int j=0;j>controladorBD.dameCarta(nombre_carta, cod_jugador).size;j++){
													    rat=controladorBD.dameCarta(cod_jugador, nombre).get(j).getRat();
													    pos=controladorBD.dameCarta(cod_jugador, nombre).get(j).getPos();
													    precio=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getPrecio();
													    pac=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getPac();
													    sho=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getSho();
													    pas=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getPas();
													    dri=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getDri();
													    def=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getDef();
													    phy=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getPhy();
													    pierna_mala=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getPierna_mala();
													    filigranas=controladorBD.CartaSimple(cod_jugador, nombre).get(j).getFiligranas();
													   
													   
												   }
												  		
												     out.print("<td width='60' rowspan='2'>"+ "</td>"+
												      "<td width='325' colspan='3' style='padding-left: 15px;'>"+nombreJug+"</td>"+
												      "<td rowspan='2' width='60' style='text-align: center;'>"+rat+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+pos+ "</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+nombre+"</td>"+
													  "<td rowspan='2' width='100' style='text-align: center;'>"+precio+"</td>"+
													  "<td rowspan='2' width='100' style='text-align: center;'>"+pierna_mala+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+filigranas+"</td>"+
													  "<td rowspan='2'width='60' style='text-align: center;'>"+pac+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+sho+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+pas+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+dri+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+def+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+phy+"</td>"+
													  "<td rowspan='2' width='60' style='text-align: center;'>"+altura+"</td>"+
													 
													 "<tr>"+
													 "<td width='45' style='text-align: right;'>"+"Fot.Equ"+"</td>"+
													 "<td width='50' style='text-align: center;'<img src=\"images/paises/"+controladorBD.dameJugadores().get(i).getPais()+".png\" style=\"width: 18px; height: 12px\"></td>"+
													 "<td width='230'>"+"Foto.Liga"+"</td>"+
													"</tr>"
													);
													
											   
											   }
											   %>
											 
										  </tr>
										
										
										
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
									<li><a href="jugadores.asp">Listado de Ligas</a></li>
									
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>M�s Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opci�n 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Informaci�n</h3>
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
								<li>&copy; FIFA 20. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
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