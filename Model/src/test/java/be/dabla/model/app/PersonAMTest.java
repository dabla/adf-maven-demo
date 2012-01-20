package be.dabla.model.app;

import static org.junit.Assert.assertNotNull;

import java.util.Hashtable;

import javax.naming.NamingException;

import oracle.jbo.ViewObject;
import oracle.jbo.server.DataSourceContext;
import oracle.jbo.server.DataSourceContextFactory;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PersonAMTest {
    private final PersonAMFixture fixture = PersonAMFixture.getInstance();
	
	static {		
		try {
			// Construct DataSource
			final Hashtable env = new Hashtable(2);
			env.put("user", "scott");
			env.put("password", "scott");
	        
	       ((DataSourceContext)new DataSourceContextFactory().getInitialContext(null)).bind("jdbc/demo", DataSourceContext.createConnectionPoolDataSource("jdbc:oracle:thin:@localhost:1521:XE", env));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
    
    public PersonAMTest() {
    }

    @Before
    public void setUp() throws NamingException {
    }

    @After
    public void tearDown() {
    	//builder.deactivate();
    }

    @Test
    public void testAccess() {
    	ViewObject view = fixture.getApplicationModule().findViewObject("PersonVO");
    	assertNotNull(view);
    }
}