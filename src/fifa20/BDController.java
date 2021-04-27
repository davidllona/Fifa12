package fifa20;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

import org.apache.tomcat.util.http.fileupload.FileItem;




public class BDController {
	private Connection miConexion;
	private PreparedStatement consultaPrepExisteJugador;
	private PreparedStatement consultaPrepExisteEquipo;
	private PreparedStatement consultaPrepExisteNombreEquipo;
	private PreparedStatement consultaPrepExisteLiga;
	private PreparedStatement consultaPrepExisteCarta;

	public BDController() {
		try {
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			this.miConexion = DriverManager.getConnection("jdbc:mysql://localhost/fifa", "root", "");

		} catch (SQLException e) {
			System.out.println("Error en constructor BDController" + e.getMessage()); 
		}
		String sqlconsultaPrepExisteJugador = "SELECT*FROM jugadores WHERE cod_jugador=?";
		String sqlconsultaPrepExisteEquipo = "SELECT*FROM equipos WHERE cod_equipo=?";
		String sqlconsultaPrepExisteNombreEquipo = "SELECT*FROM equipos WHERE nombre=?";
		String sqlconsultaPrepExisteLiga = "SELECT*FROM ligas WHERE cod_liga=?";
		
	}
	
	public BDController(Connection miConexion) {
		super();
		this.miConexion = miConexion;
	}

	public Connection getMiConexion() {
		return miConexion;
	}

	public void setMiConexion(Connection miConexion) {
		this.miConexion = miConexion;
	}
	
	public Boolean existeJugador(int cod_jugador) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteJugador.setInt(1, cod_jugador);
			ResultSet rs = this.consultaPrepExisteJugador.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeJugador del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeEquipo(int cod_equipo) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteEquipo.setInt(1, cod_equipo);
			ResultSet rs = this.consultaPrepExisteEquipo.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeEquipo del BDController" + e.getMessage());
		}

		return existe;
	}

	public Boolean existeNombreEquipo(String nombre) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteNombreEquipo.setString(1, nombre);
			ResultSet rs = this.consultaPrepExisteNombreEquipo.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeNombreEquipo del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeLiga(int cod_liga) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteLiga.setInt(1, cod_liga);
			ResultSet rs = this.consultaPrepExisteLiga.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeLiga del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeCarta(int cod_jugador) {
		Boolean existe = false;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE cod_jugador='" + cod_jugador + "'");

			if (rs.first() == true) {
				existe = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeCarta del BDController" + e.getMessage());
		}
		return existe;
	}

	public int calcularCod_equipo() {
		int cod_equipo = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT MAX(cod_equipo) FROM equipos");

			if (rs.first() == true) {
				cod_equipo = rs.getInt(1);
				cod_equipo++;
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en calcularCod_equipo del BDController" + e.getMessage());
		}
		return cod_equipo;
	}

	public int calcularCod_jugador() {
		int cod_jugador = 1;
		try {
			Statement miStatement = this.miConexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(cod_jugador) FROM jugadores");
			if (rs.first() == true) {
				cod_jugador = rs.getInt(1);
				}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("Error en calcularCod_jugador del BDController" + e.getMessage());
		}
		return cod_jugador;
	}

	public void insertarEquipoBDD(Equipo equipo) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO equipos VALUES ('" + equipo.getCod_equipo() + "', '" + equipo.getNombre() + "', '"
					+ equipo.getCod_liga() + "')";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarEquipoBDD del BDController" + e.getMessage());
		}
	}
	
	public void insertarJugadorBDD(Jugador jugador) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO jugadores VALUES ('" + jugador.getCod_jugador() + "', '" + jugador.getNombre() + "', '"
					+ jugador.getCod_equipo() + "', '" + jugador.getPierna()+ "', '" + jugador.getAltura()+ "', '" + jugador.getPais()+ "')";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarJugadorBDD del BDController" + e.getMessage());
		}
	}
	
	public void borrarLigaBD(int cod_liga) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM ligas WHERE cod_liga='" + cod_liga + "'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarLigaBD del BDController" + e.getMessage());
		}
	}
	public void borrarJugadorBD(int cod_jugador) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM jugadores WHERE cod_jugador='" + cod_jugador + "'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarjugadorBD del BDController" + e.getMessage());
		}
	}
	
	public void borrarCartaBD(String nombre_carta, int cod_jugador) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM cartas WHERE nombre='" + nombre_carta + "' AND cod_jugador='"+cod_jugador+"'";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarCartaBD del BDController" + e.getMessage());
		}
	}
	
	public Equipo dameEquipo(int cod_equipo) {
		Equipo equipo = new Equipo();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipos WHERE cod_equipo='" + cod_equipo + "'");

			if (rs.first() == true) {
				equipo = (new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEquipo del BDController" + e.getMessage());
		}
		return equipo;
	}
	
	public ArrayList<Jugador> dameJugadoresEquipo(int cod_equipo) {
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM jugadores WHERE cod_equipo='"+cod_equipo+"'");

			while (rs.next() == true) {
				jugadores.add(new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJugadoresEquipo del BDController" + e.getMessage());
		}
		return jugadores;
	}
	public ArrayList<Equipo> dameEquiposLiga(int cod_liga) {
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipos WHERE cod_liga='"+cod_liga+"'");

			while (rs.next() == true) {
				equipos.add(new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJugadoresEquipo del BDController" + e.getMessage());
		}
		return equipos;
	}
	
	public ArrayList<Equipo> dameEquipos() {
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM equipos order by cod_equipo asc");

			while (rs.next() == true) {
				equipos.add(new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEquipos del BDController" + e.getMessage());
		}
		return equipos;
	}
	public ArrayList<Jugador> dameJugadores() {
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM jugadores order by cod_jugador asc");

			while (rs.next() == true) {
				jugadores.add(new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJugadores del BDController" + e.getMessage());
		}
		return jugadores;
	}
	
	public ArrayList<Liga> dameLigas() {
		ArrayList<Liga> ligas = new ArrayList<Liga>();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM ligas order by cod_liga asc");

			while (rs.next() == true) {
				ligas.add(new Liga(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLigas del BDController" + e.getMessage());
		}
		return ligas;
	}
	
	public int dameCodigoEquipo(String nombre_equipo) {
		int cod_equipo=0;
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT cod_equipo FROM equipos WHERE nombre='"+nombre_equipo+"'");

			if (rs.first() == true) {
				cod_equipo = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCodigoEquipo del BDController" + e.getMessage());
		}
		return cod_equipo;	
	}
	public String damePaisLiga(int cod_liga) {
		String pais="";
		
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT pais FROM ligas WHERE cod_liga='"+cod_liga+"'");

			if (rs.first() == true) {
				pais = rs.getString(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en damePaisLiga del BDController" + e.getMessage());
		}
		return pais;	
	}
	
	public Jugador dameJugador(int cod_jugador) {
		Jugador jugador=new Jugador();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM jugadores WHERE cod_jugador='"+cod_jugador+"'");

			if (rs.first() == true) {
				jugador=new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameJugadordel BDController" + e.getMessage());
		}
		return jugador;	
	}
	
	public Carta dameCarta(String nombre_carta,int cod_jugador) {
		Carta carta=new Carta();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE cod_jugador='"+cod_jugador+"' AND nombre='"+nombre_carta+"'");

			if (rs.first() == true) {
				carta=new Carta(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCarta del BDController" + e.getMessage());
		}
		return carta;	
	}
	
	public Liga dameLiga(int cod_liga) {
		Liga liga=new Liga();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM ligas WHERE cod_liga='"+cod_liga+"'");

			if (rs.first() == true) {
				liga=new Liga(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLiga del BDController" + e.getMessage());
		}
		return liga;	
	}
	public Carta dameCartaSimple(int cod_jugador) {
		Carta carta=new Carta();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE cod_jugador='"+cod_jugador+"' AND nombre LIKE 'SIMPLE'");

			if (rs.first() == true) {
				carta=new Carta(rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLiga del BDController" + e.getMessage());
		}
		return carta;	
	}
	
	public int dameCodLiga(int cod_equipo) {
		Equipo equipo=new Equipo();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM equipos WHERE cod_equipo='"+cod_equipo+"'");

			if (rs.first() == true) {
				equipo=new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameLiga del BDController" + e.getMessage());
		}
		return equipo.getCod_liga();	
	}
	
	public ArrayList<Carta> dameCartas(int cod_jugador) {
		ArrayList<Carta> cartas = new ArrayList<Carta>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE cod_jugador='"+cod_jugador+"' AND nombre!='SIMPLE'");

			while (rs.next() == true) {
				cartas.add(new Carta(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCartas del BDController" + e.getMessage());
		}
		return cartas;	
	}
	public int dameRatCarta(int cod_jugador, String nombre_carta) {
		int rat=0;
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT Rat FROM cartas WHERE cod_jugador='"+cod_jugador+"' AND nombre='"+nombre_carta+"' ");

			if (rs.first() == true) {
				rat=rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameRatCarta del BDController" + e.getMessage());
		}
		return rat;	
	}
	public static boolean isNumeric(String cadena) {
		boolean resultado;

		try {
			Integer.parseInt(cadena);
			resultado = true;
			
		} catch (NumberFormatException excepcion) {
			resultado = false;
		}
		
		return resultado;
	}
	public void guardaFotoJugador(FileItem foto) {
		  File file = new File("caquita.png") ;
          try {
			foto.write( file ) ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}