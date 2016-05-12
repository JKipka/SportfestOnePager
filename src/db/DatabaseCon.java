package db;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by kipka on 08.01.2016.
 */
public class DatabaseCon {
	public DatabaseCon() {
		// Konstruktor
	}

	// Methode, die eine SQL Verbindung zurückgibt
	public Connection getDBCon() {
		
		//SQL Verbindungsobjekt
		Connection connection = null;

		
		//Treiber laden
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			return null;
		}

		//Verbindung aufbauen und zurückgeben
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");
			return connection;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}
}
