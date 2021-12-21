FROM alpine:3.14

# Install Small Minimal Dependencies
RUN apk -v --update add \
    bash \
    curl \
    zip \
    jq \
    neofetch \
    openssl
    

# Add scripts for common dependency installation
ENV INSTALL_SCRIPT_DIR=/opt/install-scripts
ENV PATH=$PATH:$INSTALL_SCRIPT_DIR
COPY install-scripts/ $INSTALL_SCRIPT_DIR
COPY tests/ $INSTALL_SCRIPT_DIR/tests
RUN chmod +x $INSTALL_SCRIPT_DIR/* && chmod +x $INSTALL_SCRIPT_DIR/tests/*.sh

ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin

# Install Major Dependencies
RUN install-terraform
RUN install-node14
RUN install-python3
RUN install-dockercli
RUN install-go

# Test Dependencies
RUN bash $INSTALL_SCRIPT_DIR/tests/run-test.sh

# Dev Environment Dependencies and Setup
# [Option] Install zsh
ARG INSTALL_ZSH="true"
# Install needed packages and setup non-root user.
RUN apk update && install-dev "${INSTALL_ZSH}"