/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author panos
 */
public class LoginUser {

    static String driverClassName = "org.postgresql.Driver";
    static String url = "jdbc:postgresql://localhost:5432/MusicCompanyInc";
    static Connection dbConnection = null;
    static String db_username = "postgres";
    static String db_passwd = "3451";
    static Statement statement = null;
    static ResultSet rs = null;

    public static String Login(String username, String password) throws Exception {
        Class.forName(driverClassName);
        dbConnection = DriverManager.getConnection(url, db_username, db_passwd);
        statement = dbConnection.createStatement();

        rs = statement.executeQuery("SELECT loginuser('" + username + "','" + password + "') AS loggedIn");
        
        String isLoggedIn = "";
        while (rs.next()) {
            isLoggedIn = rs.getString("loggedIn");
        }
        
        statement.close();
        statement.close();
        dbConnection.close();
        return isLoggedIn;
    }
}
