package org.glassfish.extras;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.DependencyResolvers;
import org.jboss.shrinkwrap.resolver.api.maven.MavenDependencyResolver;

public abstract class EmbeddedGlassfishTestCase {
	protected static final Logger logger = Logger.getLogger(EmbeddedGlassfishTestCase.class.getName());
	
	@Deployment
    public static WebArchive createDeployment()
    {org.jboss.shrinkwrap.impl.base.filter.ExcludeRegExpPaths d;
            final WebArchive war = ShrinkWrap.create(WebArchive.class, "test.jar")
            				.setWebXML((new File("src/test/resources/web.xml").exists() ? new File("src/test/resources/web.xml") : new File("src/main/webapp/WEB-INF/web.xml")))
                            .addPackage(Package.getPackage("be.dabla.model"));
            				addWebResourcesRecusively(war, new File("src/main/webapp"))
            				.addAsWebInfResource(new File("src/test/resources/META-INF/adf-config.xml"), "classes/META-INF/adf-config.xml")
                            .addAsWebInfResource(new File("src/main/resources/view/DataBindings.cpx"), "classes/view/DataBindings.cpx")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/adfc-config.xml"), "adfc-config.xml")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/faces-config.xml"), "faces-config.xml")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/trinidad-config.xml"), "trinidad-config.xml")
                            .addAsLibraries(DependencyResolvers.use(MavenDependencyResolver.class)
							.artifacts(new String[]{"be.dabla:adf-maven-demo_model:1.0.0-SNAPSHOT"})
							.resolveAsFiles());

            return war;
    }
	
	/**
	 * We don't want to add web resources manually, so resolve web resources dynamically under webapp dir and add them to web archive
	 * 
	 * @param war
	 * @param file
	 */
	public static WebArchive addWebResourcesRecusively(final WebArchive war, final File file) {
		if (!file.isHidden()) {
			if (!file.isDirectory()) {
				final String name = file.getPath().substring(file.getPath().indexOf("webapp") + "webapp".length());

				if (name.indexOf("WEB-INF") == -1) {
					logger.log(Level.INFO, "Adding web resource ''{0}''", name);
					
					war.addAsWebResource(new File("src/main/webapp", name), name);
				}
			}
			
		    final File[] children = file.listFiles();
		    
		    if (children != null) {
			    for (File child : children) {
			    	addWebResourcesRecusively(war, child);
			    }
		    }
		}
		
		return war;
	}
}