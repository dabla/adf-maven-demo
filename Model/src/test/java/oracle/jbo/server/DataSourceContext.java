package oracle.jbo.server;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.naming.Context;
import javax.naming.InvalidNameException;
import javax.naming.Name;
import javax.naming.NameNotFoundException;
import javax.naming.NameParser;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;

import oracle.jbo.client.DatabaseConnectionProvider;
import oracle.jbo.client.DatabaseConnectionProviderFactory;

// Simple hack to allow the addition of datasources to the JNDI context
public class DataSourceContext
    implements Context
{

    public DataSourceContext()
    {
        mDataSources = new ConcurrentHashMap();
    }

    public Object lookup(Name name)
        throws NamingException
    {
        return lookup(name.toString());
    }
    
    public static ConnectionPoolDataSource createConnectionPoolDataSource(String connectStr, Hashtable env)
    {
    	return new ConnectionPoolDataSource(connectStr, env);
    }
    
    public static String preprocessDataSourceName(String name)
    {
        if(name.startsWith("java:comp/env/"))
            return name.substring("java:comp/env/".length());
        else
            return name;
    }

    public Object lookup(String name)
        throws NamingException
    {
        ConnectionPoolDataSource ds = (ConnectionPoolDataSource)mDataSources.get(name);
        if(ds != null)
            return ds;
        String connName = null;
        if(name.startsWith("jdbc/"))
            connName = name.substring("jdbc/".length());
        else
        if(name.startsWith("java:comp/env/jdbc/"))
            connName = name.substring("java:comp/env/jdbc/".length());
        else
            throw new InvalidNameException((new StringBuilder()).append("Invalid name passed to DataSourceContext:  ").append(name).toString());
        if(connName.endsWith("DS"))
            connName = connName.substring(0, connName.length() - 2);
        String connectStr = null;
        Hashtable ht = new Hashtable();
        Iterator i$ = DatabaseConnectionProviderFactory.getProviders().iterator();
        do
        {
            if(!i$.hasNext())
                break;
            DatabaseConnectionProvider prov = (DatabaseConnectionProvider)i$.next();
            connectStr = prov.getConnectionURL(connName, ht);
        } while(connectStr == null);
        if(connectStr == null)
        {
            throw new NameNotFoundException((new StringBuilder()).append("DataSourceContext could not locate a DataSource for the name:  ").append(name).toString());
        } else
        {
            ds = new ConnectionPoolDataSource(connectStr, ht);
            mDataSources.put(name, ds);
            return ds;
        }
    }

    public void bind(Name name, Object obj)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void bind(String name, Object obj)
        throws NamingException
    {
    	mDataSources.put(name, obj);
    }

    public void rebind(Name name, Object obj)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void rebind(String name, Object obj)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void unbind(Name name)
        throws NamingException
    {
        unbind(name.toString());
    }

    public void unbind(String s)
        throws NamingException
    {
    }

    public void rename(Name oldName, Name newName)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void rename(String oldName, String newName)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NamingEnumeration list(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NamingEnumeration list(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NamingEnumeration listBindings(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NamingEnumeration listBindings(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void destroySubcontext(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public void destroySubcontext(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Context createSubcontext(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Context createSubcontext(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Object lookupLink(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Object lookupLink(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NameParser getNameParser(Name name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public NameParser getNameParser(String name)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Name composeName(Name name, Name prefix)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public String composeName(String name, String prefix)
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    public Object addToEnvironment(String propName, Object propVal)
        throws NamingException
    {
        return null;
    }

    public Object removeFromEnvironment(String propName)
        throws NamingException
    {
        return null;
    }

    public Hashtable getEnvironment()
        throws NamingException
    {
        return null;
    }

    public void close()
        throws NamingException
    {
    }

    public String getNameInNamespace()
        throws NamingException
    {
        throw new UnsupportedOperationException();
    }

    private Map mDataSources;
    private static final String PREFIX_1 = "jdbc/";
    private static final String PREFIX_2 = "java:comp/env/jdbc/";
    private static final String PREFIX_3 = "java:comp/env/";
}