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

