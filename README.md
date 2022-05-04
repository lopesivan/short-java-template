# Short java Project

## Usage:

### Class:

```
    make HelloWorldApp
    java -classpath bin HelloWorldApp
```

### Jar:

```
    make HelloWorldApp.jar
    java -jar jars/HelloWorldApp.jar
```

### Jar 2:
file: manifest.mf
```
Manifest-version: 1.0
Main-Class: HelloWorldApp
```

```
javac HelloWorldApp.java
jar cfm HelloWorldApp.jar manifest.mf HelloWorldApp.class
java -jar HelloWorldApp.jar
```



```
javac hello_world_app.java
jar cfm hello_world_app.jar manifest.mf HelloWorldApp.class
java -jar hello_world_app.jar
```

