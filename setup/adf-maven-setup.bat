@echo off
IF NOT EXIST "%MIDDLEWARE_HOME%" set MIDDLEWARE_HOME=C:/Oracle/Middleware

IF EXIST %MIDDLEWARE_HOME%\NUL GOTO install
echo Incorrect Middleware path '%MIDDLEWARE_HOME%', please correct the variable in adf-maven-setup.bat-file!
pause
exit

:install
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.facesconfigdt_11.1.1/facesconfigmodel.jar -DgroupId=com.oracle.facesconfigdt -DartifactId=facesconfigmodel -Dversion=1.1.14 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/adf-faces-databinding-rt.jar -DgroupId=com.oracle.adf.view -DartifactId=adf-faces-databinding-rt -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/adf-richclient-api-11.jar -DgroupId=com.oracle.adf.view -DartifactId=adf-richclient-api-11 -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/adf-richclient-impl-11.jar -DgroupId=com.oracle.adf.view -DartifactId=adf-richclient-impl-11 -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/bundleresolver.jar -DgroupId=com.oracle.adf.view -DartifactId=bundleresolver -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/dvt-faces.jar -DgroupId=com.oracle.adf.view -DartifactId=dvt-faces -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/dvt-jclient.jar -DgroupId=com.oracle.adf.view -DartifactId=dvt-jclient -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/dvt-trinidad.jar -DgroupId=com.oracle.adf.view -DartifactId=dvt-trinidad -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/dvt-utils.jar -DgroupId=com.oracle.adf.view -DartifactId=dvt-utils -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.view_11.1.1/oracle-page-templates.jar -DgroupId=com.oracle.adf.view -DartifactId=oracle-page-templates -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.mds_11.1.1/mdsrt.jar -DgroupId=com.oracle.mds -DartifactId=mdsrt -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jdbc_11.1.1/ojdbc6dms.jar -DgroupId=com.oracle.jdbc -DartifactId=ojdbc6dms -Dversion=11.2.0.2.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jrf_11.1.1/jrf-api.jar -DgroupId=com.oracle.jrf -DartifactId=jrf-api -Dversion=11.1.1.0.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share_11.1.1/adf-share-support.jar -DgroupId=com.oracle.adf.share -DartifactId=adf-share-support -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share_11.1.1/adfsharembean.jar -DgroupId=com.oracle.adf.share -DartifactId=adfsharembean -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share_11.1.1/adflogginghandler.jar -DgroupId=com.oracle.adf.share -DartifactId=adflogginghandler -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share_11.1.1/commons-el.jar -DgroupId=com.oracle.adf.share -DartifactId=commons-el -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share_11.1.1/oracle-el.jar -DgroupId=com.oracle.adf.share -DartifactId=oracle-el -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share.ca_11.1.1/adf-share-base.jar -DgroupId=com.oracle.adf.share.ca -DartifactId=adf-share-base -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.share.ca_11.1.1/adf-share-ca.jar -DgroupId=com.oracle.adf.share.ca -DartifactId=adf-share-ca -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.model_11.1.1/adfm.jar -DgroupId=com.oracle.adf.model -DartifactId=adfm -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.model_11.1.1/adfmweb.jar -DgroupId=com.oracle.adf.model -DartifactId=adfmweb -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.model_11.1.1/db-ca.jar -DgroupId=com.oracle.adf.model -DartifactId=db-ca -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.model_11.1.1/bc4j-mbeans.jar -DgroupId=com.oracle.adf.model -DartifactId=bc4j-mbeans -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.model_11.1.1/adflibfilter.jar -DgroupId=com.oracle.adf.model -DartifactId=adflibfilter -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.javacache_11.1.1/cache.jar -DgroupId=com.oracle.javacache -DartifactId=cache -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.dms_11.1.1/dms.jar -DgroupId=com.oracle.dms -DartifactId=dms -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.odl_11.1.1/ojdl.jar -DgroupId=com.oracle.odl -DartifactId=ojdl -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.bali.share_11.1.1/share.jar -DgroupId=com.oracle.bali.share -DartifactId=share -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.xmlef_11.1.1/xmlef.jar -DgroupId=com.oracle.xmlef -DartifactId=xmlef -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jmx_11.1.1/jmxframework.jar -DgroupId=com.oracle.as.jmx -DartifactId=jmxframework -Dversion=11.1.1.0.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jmx_11.1.1/jmxspi.jar -DgroupId=com.oracle.as.jmx -DartifactId=jmxspi -Dversion=11.1.1.0.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.xdb_11.1.0.jar -DgroupId=com.oracle -DartifactId=xdb -Dversion=11.1.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.xdk_11.1.0/xmlparserv2.jar -DgroupId=com.oracle.xdk -DartifactId=xmlparserv2 -Dversion=11.1.1.3.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.javatools_11.1.1/javatools-nodeps.jar -DgroupId=com.oracle.javatools -DartifactId=javatools-nodeps -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.javatools_11.1.1/resourcebundle.jar -DgroupId=com.oracle.javatools -DartifactId=resourcebundle -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.controller_11.1.1/adf-controller.jar -DgroupId=com.oracle.adf.controller -DartifactId=adf-controller -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.controller_11.1.1/adf-controller-api.jar -DgroupId=com.oracle.adf.controller -DartifactId=adf-controller-api -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.controller_11.1.1/adf-controller-rt-common.jar -DgroupId=com.oracle.adf.controller -DartifactId=adf-controller-rt-common -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.security_11.1.1/adf-controller-security.jar -DgroupId=com.oracle.adf.security -DartifactId=adf-controller-security -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.security_11.1.1/adf-share-security.jar -DgroupId=com.oracle.adf.security -DartifactId=adf-share-security -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.pageflow_11.1.1/adf-pageflow-fwk.jar -DgroupId=com.oracle.adf.pageflow -DartifactId=adf-pageflow-fwk -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true
call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.adf.pageflow_11.1.1/adf-pageflow-impl.jar -DgroupId=com.oracle.adf.pageflow -DartifactId=adf-pageflow-impl -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jsp_11.1.1/ojsp.jar -DgroupId=com.oracle.jsp -DartifactId=ojsp -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true	

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/modules/oracle.jps_11.1.1/jps-ee.jar -DgroupId=com.oracle.jps -DartifactId=jps-ee -Dversion=11.1.1.4.0 -Dpackaging=jar -DgeneratePom=true

call mvn install:install-file -Dfile=%MIDDLEWARE_HOME%/oracle_common/webservices/wsclient_extended.jar -DgroupId=com.oracle.webservices -DartifactId=wsclient-extended -Dversion=11.1.1 -Dpackaging=jar -DgeneratePom=true

set MAVEN_REPO=%USERPROFILE%/.m2/repository

xcopy "com/oracle/adf/parent" "%MAVEN_REPO%/com/oracle/adf/parent" /E/I
xcopy "com/oracle/adf/controller/parent" "%MAVEN_REPO%/com/oracle/adf/controller/parent" /E/I
xcopy "com/oracle/adf/model/parent" "%MAVEN_REPO%/com/oracle/adf/model/parent" /E/I
xcopy "com/oracle/adf/pageflow/parent" "%MAVEN_REPO%/com/oracle/adf/pageflow/parent" /E/I
xcopy "com/oracle/adf/security/parent" "%MAVEN_REPO%/com/oracle/adf/security/parent" /E/I
xcopy "com/oracle/adf/share/parent" "%MAVEN_REPO%/com/oracle/adf/share/parent" /E/I
xcopy "com/oracle/adf/share/ca/parent" "%MAVEN_REPO%/com/oracle/adf/share/ca/parent" /E/I
xcopy "com/oracle/adf/view/parent" "%MAVEN_REPO%/com/oracle/adf/view/parent" /E/I
xcopy "com/oracle/as/jmx/parent" "%MAVEN_REPO%/com/oracle/as/jmx/parent" /E/I
xcopy "com/oracle/javatools/parent" "%MAVEN_REPO%/com/oracle/javatools/parent" /E/I