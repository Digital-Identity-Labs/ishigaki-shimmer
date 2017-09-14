FROM maven:3.5.0-jdk-8 as shim_deps

ARG WD=/usr/local/src/shib_shim

WORKDIR $WD

COPY pom.xml $WD

RUN mvn install && \
    rm -rfv target/maven-archiver target/shimmer-1.0-SNAPSHOT.jar && \
    ls -lR $WD



FROM digitalidentity/ishigaki:latest
# (Don't use latest in production)

LABEL description="Ishigaki IdP plus a generic external authentication extension" \
      version="0.0.1" \
      maintainer="pete@digitalidentitylabs.com"

COPY --from=shim_deps /usr/local/src/shib_shim/target /opt/shibboleth-idp/edit-webapp/WEB-INF/lib

## This is an optional script to tidy up file permissions, etc.
RUN $ADMIN_HOME/prepare_apps.sh
RUN $ADMIN_HOME/prepare_apps.sh