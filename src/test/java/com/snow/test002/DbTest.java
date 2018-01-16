package com.snow.test002;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class DbTest {
	
	@Test
	public void dbTest() throws Exception {
	    Class.forName("com.mysql.jdbc.Driver");
	    
	    try {
		    Connection con =  DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myDb","root","qwe123");
		    assertThat(con, is(notNullValue()));
	    } catch (Exception e) {
            e.printStackTrace();
            fail(e.toString());
        }
	}
}
