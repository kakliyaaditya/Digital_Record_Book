/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pict.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author sameer
 */
public class DeleteTable {

    Connection conn;
    
    public void deleteAssign(String username,String assignName) throws SQLException{
    
        conn = ConnectDatabase.getConnection();
        String query="call deleteA('"+username.trim()+"','"+assignName.trim()+"');";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
    }
    
}

