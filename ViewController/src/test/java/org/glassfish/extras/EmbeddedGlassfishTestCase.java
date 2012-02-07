package org.glassfish.extras;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.exporter.ExplodedExporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.DependencyResolvers;
import org.jboss.shrinkwrap.resolver.api.maven.MavenDependencyResolver;

public abstract class EmbeddedGlassfishTestCase {
	protected static final Logger logger = Logger.getLogger(EmbeddedGlassfishTestCase.class.getName());
	
	@Deployment
    public static WebArchive createDeployment() throws IOException {
        final WebArchive war = ShrinkWrap.create(WebArchive.class, "test.jar").setWebXML((new File("src/test/resources/web.xml").exists() ? new File("src/test/resources/web.xml") : new File("src/main/webapp/WEB-INF/web.xml"))).addPackage(Package.getPackage("be.dabla.model"));
        final File files[] = DependencyResolvers.use(MavenDependencyResolver.class).artifacts(new String[]{"be.dabla:adf-maven-demo_model:1.0.0-SNAPSHOT"}).resolveAsFiles();
        addWebResourcesRecusively(war, new File("src/main/webapp"), files)
        .addAsWebInfResource(new File("src/test/resources/META-INF/adf-config.xml"), "classes/META-INF/adf-config.xml")
                            .addAsWebInfResource(new File("src/main/resources/view/DataBindings.cpx"), "classes/view/DataBindings.cpx")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/adfc-config.xml"), "adfc-config.xml")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/faces-config.xml"), "faces-config.xml")
                            .addAsWebInfResource(new File("src/main/webapp/WEB-INF/trinidad-config.xml"), "trinidad-config.xml")
        .addAsLibraries(files);
        war.as(ExplodedExporter.class).exportExploded(new File("target")); // Directory to which we'll export
                
        return war;
    }

    /**
     * We don't want to add web resources manually, so resolve web resources
     * dynamically under webapp dir and add them to web archive
     *
     * @param war
     * @param file
     */
    public static WebArchive addWebResourcesRecusively(final WebArchive war, final File file, final File files[]) throws IOException {
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
                    addWebResourcesRecusively(war, child, files);
                }
            }
        }
        
        addJarResourcesToWebResources(war, files);

        return war;
    }
    
    public static void addJarResourcesToWebResources(final WebArchive war, final File files[]) throws IOException {
        if (files != null) {
            for (final File jarFile : files) {
                final JarFile jar = new JarFile(jarFile);
                final Enumeration e = jar.entries();
                while (e.hasMoreElements()) {
                    final JarEntry jarEntry = (JarEntry)e.nextElement();
                    final File file = new File("target/pages", jarEntry.getName());
                    
                    if (file.getName().indexOf(".jsp") > -1) {
                        createDirectoriesRecusively(file, 0);
                        
                        InputStream is = null;
                        FileOutputStream fos = null;
                        try {
                            is = jar.getInputStream(jarEntry);
                            fos = new java.io.FileOutputStream(file);
                            while (is.available() > 0) {
                                fos.write(is.read());
                            }
                        }
                        finally {
                            if (fos != null) {
                                fos.close();
                            }

                            if (is != null) {
                                is.close();
                            }

                            logger.log(Level.INFO, "Adding web resource ''{0}''", jarEntry.getName());
                            
                            war.addAsWebResource(file, jarEntry.getName());
                        }
                    }
                }
            }
        }
    }
    
    private static void createDirectoriesRecusively(final File file, final int index) {
        final int i = file.getPath().indexOf(File.separatorChar, index);
        
        if (i > -1) {
            final File dir = new File(file.getPath().substring(0, i));
            
            if (!dir.exists()) {
                dir.mkdir();
                logger.log(Level.FINE, "Created directory ''{0}''", dir.getPath());
            }
            
            createDirectoriesRecusively(file, i + 1);
        }
    }
}