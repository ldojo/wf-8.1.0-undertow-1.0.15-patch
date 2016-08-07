# wf-8.1.0-undertow-1.0.15-patch
Wildfly 8.1.0.Final has a bug in the undertow-1.0.15.Final module--this contains a patch

The bug is described in detail in [this stackoverflow article](http://stackoverflow.com/questions/34354481/org-springframework-web-util-nestedservletexception-request-processing-failed)

The problem is a NullPointerException here:
```
    at io.undertow.servlet.spec.HttpServletResponseImpl.getHeaders(HttpServletResponseImpl.java:248) [undertow-servlet-1.0.15.Final.jar:1.0.15.Final]
```

where the code (line 248) causing the NPE is:

```
    @Override
    public Collection<String> getHeaders(final String name) {
        return new ArrayList<String>(exchange.getResponseHeaders().get(name));
    }
```

The diff of the fix patch is :

```
46d45
< import io.undertow.util.HeaderValues;
249,253c248
< 	final HeaderValues headerValues = exchange.getResponseHeaders().get(name);
< 	if (headerValues != null) {
< 	    return new ArrayList<String>(headerValues);
< 	}
< 	return new ArrayList<String>();
---
>         return new ArrayList<String>(exchange.getResponseHeaders().get(name));
```

You can patch your existing WF 8.1.0.Final installation with a simple bash shell script if you don't want to (or can't) upgrade your WF installation to > 8.2.*, which doesnt have this problem.




