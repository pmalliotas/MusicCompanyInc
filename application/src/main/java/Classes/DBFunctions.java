/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author panos
 */
public class DBFunctions {
    static String driverClassName = "org.postgresql.Driver";
    static String url = "jdbc:postgresql://localhost:5432/MusicCompanyInc";
    static Connection dbConnection = null;
    static String db_username = "postgres";
    static String db_passwd = "sakasaka";
    static Statement statement = null;
    static ResultSet rs = null;
    
    public static ResultSet GetAllArtists() throws Exception{
        Class.forName(driverClassName);
        dbConnection = DriverManager.getConnection(url, db_username, db_passwd);
        statement = dbConnection.createStatement();
        
        rs = statement.executeQuery("SELECT * FROM GetAllArtists() as Artists");
        return rs;
    }
}
