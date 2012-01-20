Before you can build the Maven project, you should edit the adf-maven-setup.bat-file under the setup directory.

There you need to edit the MIDDLEWARE_HOME environment variable so that it matches your local installation directory of the Oracle Fusion Middleware.

Also make sure that Maven is installed and available in your classpath before launching the bat-file.

Finally make sure that you have an Oracle database up and running. In the Model project, check the PersonAMTest class and modify the connection settings, if needed, so that they match those of your local installation.

The database you're referring to doesn't need to contain any tables, you're fine as long as the connection to the database succeeds.

To generate the project files for JDeveloper, run the following command from the root of the project (also see explanation at http://www.gwr.no/?p=501):

mvn -Djdev.release=11.1.1.1.0 org.apache.myfaces.trinidadbuild:maven-jdev-plugin:jdev