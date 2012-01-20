package be.dabla.model.app;

import oracle.jbo.ApplicationModule;
import oracle.jbo.client.Configuration;

public class PersonAMFixture {
    private static final PersonAMFixture fixture1 = new PersonAMFixture();
    private final ApplicationModule _am;

    private PersonAMFixture() {
        _am = Configuration.createRootApplicationModule("be.dabla.model.app.PersonAM","PersonAppModuleLocal");
    }

    public void setUp() {
    }

    public void tearDown() {
    }

    public static PersonAMFixture getInstance() {
        return fixture1;
    }

    public void release() throws Exception {
        Configuration.releaseRootApplicationModule(_am, true);
    }

    public ApplicationModule getApplicationModule() {
        return _am;
    }
}
