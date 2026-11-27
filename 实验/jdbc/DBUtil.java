package shop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
	private static final String className = "com.mysql.jdbc.Driver";
	private static final String user = "root";
	private static final String password = "root";
	private static final String url = "jdbc:mysql://localhost:3306/shop";
	private static Connection connection;
	static{
		try {
			Class.forName(className);
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		return connection;
	}
	
	public static ResultSet executeQuery(String sql){
		try {
			Statement st = connection.createStatement();
			return st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static ResultSet executeQuery(String sql, Object[] params){
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
			   if(params[i] instanceof Integer){	 
				 pst.setInt(i+1, (Integer)params[i]);
			   }else if(params[i] instanceof String){
				   pst.setString(i+1, (String)params[i]);
			   }else if(params[i] instanceof Float){
				   pst.setFloat(i+1, (Float)params[i]);
			   }else if(params[i] instanceof Double){
				   pst.setDouble(i+1, (Double)params[i]);
			   }else if(params[i] instanceof Boolean){
				   pst.setBoolean(i+1, (Boolean)params[i]);
			   }	 
			}
			return pst.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static int executeUpdate(String sql, Object[] params){
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				if(params[i] instanceof Integer){	 
					pst.setInt(i+1, (Integer)params[i]);
				}else if(params[i] instanceof String){
					pst.setString(i+1, (String)params[i]);
				}else if(params[i] instanceof Float){
					pst.setFloat(i+1, (Float)params[i]);
				}else if(params[i] instanceof Double){
					pst.setDouble(i+1, (Double)params[i]);
				}else if(params[i] instanceof Boolean){
					pst.setBoolean(i+1, (Boolean)params[i]);
				}	 
			}
			return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	public static int executeUpdate(String sql){
		try {
			Statement st = connection.createStatement();
			return st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int getRecordCount(String tableName){
		ResultSet rs = executeQuery("select count(*) from " + tableName);
		try {
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	

	
}


