#!/usr/bin/env bash
set -e

# first, start tomcat
/home/OMM/OracleMetadataManagement/tomcat/bin/startup.sh
/home/OMM/OracleMetadataManagement/RestartServerApplication.sh
# shell
/bin/bash