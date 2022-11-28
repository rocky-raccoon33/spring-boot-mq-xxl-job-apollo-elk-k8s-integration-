# list all modules under maven project: $ mvn help:evaluate -Dexpression=project.modules
# Build and create docker images for all modules from parent: $ mvn clean package spring-boot:build-image
# Execute maven goal on specific module from parent:
# $ mvn clean spring-boot:run -pl service-name
# mvn clean package spring-boot:build-image -pl service-name
