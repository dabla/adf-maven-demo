package be.dabla.model;

import java.io.IOException;
import java.util.logging.Level;

import junit.framework.Assert;

import org.glassfish.extras.EmbeddedGlassfishTestCase;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.jsfunit.api.InitialPage;
import org.jboss.jsfunit.jsfsession.JSFClientSession;
import org.jboss.jsfunit.jsfsession.JSFServerSession;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(Arquillian.class)
public class UserSecurityBeanTest extends EmbeddedGlassfishTestCase {
	 @Test @InitialPage("/faces/TestPage.jspx")
	 public void testInitialPage(final JSFServerSession server, final JSFClientSession client) throws IOException {
		 logger.log(Level.FINE, "server: {0}", server);
	     
		 Assert.assertEquals("/TestPage.jspx", server.getCurrentViewID());
		 
		 logger.log(Level.FINE, client.getPageAsText());
		 
		 System.out.println(client.getPageAsText());
		 
		 client.click("cb1");
	 }
}