package health;

import java.sql.Connection;
import java.sql.DriverManager;

public class ASD {

	 
	
	 
	
	 
	    private static final String DRIVER = "org.h2.Driver";
	    private static final String URL = "jdbc:h2:tcp://localhost/~/test";
	    private static final String USER = "sa";
	    private static final String PW = "1";
	    
	
	    public void testConnection() throws Exception{
	        
	        Class.forName(DRIVER);
	        
	        try(Connection con = DriverManager.getConnection(URL, USER, PW)){
	            System.out.println(con);
	            
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}