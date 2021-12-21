#!/bin/bash
echo $0
cd $(dirname "$0")

source test-utils.sh

# OS Packages
PACKAGE_LIST="jq \
        bash \
        curl \
        zip \
        jq \
        openssl"

checkOSPackages "common-os-packages" ${PACKAGE_LIST}

# Major Dependencies
check "node" node --version
check "npm" npm --version
check "terraform" terraform --version
check "pip" pip --version
check "python3" python3 --version
check "docker" docker -v
check "install scripts directory" [ -d $INSTALL_SCRIPT_DIR ]

# Report result
reportResults