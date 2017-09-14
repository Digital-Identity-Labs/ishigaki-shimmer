FROM maven:3.5.0-jdk-8 as shim_builder

ARG WD=/usr/local/src/shib_shim

COPY    shib_shim $WD
WORKDIR $WD

RUN  mvn package



#FROM digitalidentity/ishigaki:latest
## (Don't use latest in production)
#
#LABEL description="Indiid Primary SAML IdP" \
#      version="0.0.1" \
#      maintainer="pete@digitalidentitylabs.com"
#
#
#
###
#
#
### This is an optional script to tidy up file permissions, etc.
#RUN $ADMIN_HOME/prepare_apps.sh