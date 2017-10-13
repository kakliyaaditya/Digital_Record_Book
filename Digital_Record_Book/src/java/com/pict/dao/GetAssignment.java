/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pict.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.*;

/**
 *
 * @author sameer
 */
public class GetAssignment {

    Connection conn;

    public void assignmentList(String usrname, String grpname, String tableName[]) throws ClassNotFoundException, SQLException, JSONException {

        String query = "select AssignmentName from AssignmentExist where SubjectCode=(select SubjectCode from UserInfo where UserID='"+usrname.trim()+"' and GroupCode=(select GroupCode from GroupTable where GroupName='"+grpname.trim()+"')) order by AssignmentName;";

        conn = ConnectDatabase.getConnection();
        JSONObject assigns = new JSONObject();

        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        int i = 0;  
        while (rs.next()) {
            tableName[i] = rs.getString("AssignmentName");
            i++;
        }

    }

    
    public int assignmentCount(String usrname, String grpname) throws ClassNotFoundException, SQLException {

        conn = ConnectDatabase.getConnection();
        //String query2="select StartRollNo,EndRollNo from GroupStart where GroupID=(select GroupCode from GroupTable where GroupName="+grpname.trim()+");";
        
        
        
        String query = "select count(AssignmentName) from AssignmentExist where SubjectCode=(select SubjectCode from UserInfo where UserID='"+usrname.trim()+"' and GroupCode=(select GroupCode from GroupTable where GroupName='"+grpname.trim()+"'));";

        PreparedStatement stmt = conn.prepareStatement(query);
      
       
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return Integer.parseInt(rs.getString("count(AssignmentName)"));
        }
        return 0;
    }

    /*public JSONObject assignment(String usrname, String grpname) throws ClassNotFoundException, SQLException, JSONException {

        String query = "select AssignmentName from AssignmentExist where GroupName=? and UserID=?;";

        conn = ConnectDatabase.getConnection();
        JSONObject assigns = new JSONObject();

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, grpname);
        stmt.setString(2, usrname);
        ResultSet rs = stmt.executeQuery();
        int i = 0;
        assigns.put("name", "Sameer");

        return assigns;
    }
*/
    public boolean isCoordinator(String username) throws SQLException {

        conn = ConnectDatabase.getConnection();
        String query1 = "select UserID from SubjectCoordinator where UserID='"   + username.trim() + "' and SubjectCode=any(select SubjectCode from UserInfo where UserID='"+username.trim()+"' and GroupCode=any(select GroupCode from GroupTable where EndRollNo-StartRollNo<20));";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query1);
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }

    public JSONObject assignment(String jkk, String l10) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
