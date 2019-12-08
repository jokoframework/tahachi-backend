# tahachi-backend
Spring Boot app for remote desktop lock/unlock

Tahachi comes from guarani. It means guardian, soldier.

This is a REST API that uses JWT for autentication. It uses SSL on port 8443 with a self signed certificate.
Sample `keystore.jks` is provided for **testing purposes only**.
In real life scenarios you sould customize your security settings, including user/passwords and keystore credentials.

Based on [joko_backend_starter_kit](https://github.com/jokoframework/joko_backend_starter_kit)

## Running
Detailed instructionds here [RUN.md](RUN.md)

# Customizing lock/unlock command
Currently sample `application.properties` contains Cinnamon Desktop command lines, you should change your command according to your desktop environment.

```
desktop.lockcommand=cinnamon-screensaver-command -l -m \"Bloqueado desde mi smartphone\"
desktop.unlockcommand=cinnamon-screensaver-command --deactivate
```

