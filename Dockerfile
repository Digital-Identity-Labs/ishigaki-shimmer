FROM digitalidentity/ishigaki:latest
# (Don't use latest in production)

LABEL description="Indiid Primary SAML IdP" \
      version="0.0.1" \
      maintainer="pete@digitalidentitylabs.com"



## Copy your configuration files over into the image
COPY optfs /opt

## This is an optional script to tidy up file permissions, etc.
RUN $ADMIN_HOME/prepare_apps.sh