package com.icbt.oceanview.dao;
import java.sql.Connection;

public class DBConnectionTest {
	
	    public static void main(String[] args) {
	        Connection con = DBConnection.getConnection();
	        if(con != null){
	            System.out.println("DB connected successfully!");
	        } else {
	            System.out.println("DB connection failed!");
	        }
	    }
	}


