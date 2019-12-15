## Requisitos para ejecutar el servicio

* IDE with Apache MAVEN
* Java 11 (JDK11) (I recommend [Sdkman](https://sdkman.io/) for managing multiple java versions)
* By default we use embedded h2


## Build executable JAR 
 
 ### Step 1) Create tahachi-backend base directory
 
 Example `/opt/j/tahachi` 
 
 This will contain the program and its configuration. 
  
 You will refer to this as PROFILE_DIR, maven parameter "ext.prop.dir".
 
 Note: There's a sample configuration file provided in  `src/main/resources/application.properties`
  
  ### Step 2) Install base Joko libraries
	

https://github.com/jokoframework/joko-utils

https://github.com/jokoframework/security

- Joko-utils `mvn install`, you might need to run this workaround depending on your environment
 
 `mvn install -Ddownloader.quick.query.timestamp=false`

-Joko [security](https://github.com/jokoframework/security): Follow on site instructions  

### Step 3 Corren con Maven

Una vez hechos estos cambios, solo debemos correr el proyecto como una 
aplicación de Spring Boot, o con la línea de comando (se requiere maven instalado).

```shell
  $ mvn spring-boot:run -Dext.prop.dir=/opt/j/tahachi -Dspring.config.location=file:///opt/j/tahachi/application.properties
```

User/Pass with default values are created: `admin/123456`

### Step 4: Init script

By default cinnamon requires that a program/shell that will send commands to user session is started from within the session.
So my recommendation is that you place it on "Startup applications". 
It will not work as a standard system service. It needs a valid cinnamon session.
A sample script is provided [tahachi-backend.sh](scripts/tahachi-backend.sh)

## FIRST RUN
Sample `application.properties` provided as a sample, will create a H2 Database in user's home directory.
After first run you should:
 * Disable database initialization
    `spring.datasource.initialization-mode=never`
 * **Change admin password**: 
 
 Joko Security uses BCrypt to hash passwords. 
 
 To generate a new password you can use provided [token-localhost.sh](scripts/token-localhost.sh) script, it uses default credentials to obtain a valid access token. 
   
   Use the access token, to create a new password with your favourite REST client, or use this curl
   :

```shell 
 curl -X PUT "http://localhost:8080/api/secure/users" -H  "accept: */*" -H  "X-JOKO-AUTH: YOUR_ACCESS_TOKEN" -H  "X-JOKO-STARTER-KIT-VERSION: 1.0" -H  "Content-Type: application/json" -d "{  \"password\": \"NEWPASSWORD\",  \"username\": \"admin}" 
```

### Swagger API

API uses swagger for documentation

http://localhost:8080/swagger-ui.html

