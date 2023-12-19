## dcape-app-template Makefile
## This file extends Makefile.app from dcape
#:

SHELL               = /bin/bash
CFG                ?= .env
CFG_BAK            ?= $(CFG).bak

#- App name
APP_NAME           ?= telegraf

#- Docker image name
IMAGE              ?= telegraf

#- Docker image tag
IMAGE_VER          ?= 1.29.1-alpine

# ------------------------------------------------------------------------------

# if exists - load old values
-include $(CFG_BAK)
export

-include $(CFG)
export

# ------------------------------------------------------------------------------
# Find and include DCAPE_ROOT/Makefile
DCAPE_COMPOSE   ?= dcape-compose
DCAPE_ROOT      ?= $(shell docker inspect -f "{{.Config.Labels.dcape_root}}" $(DCAPE_COMPOSE))

ifeq ($(shell test -e $(DCAPE_ROOT)/Makefile.app && echo -n yes),yes)
  include $(DCAPE_ROOT)/Makefile.app
else
  include /opt/dcape/Makefile.app
endif

# ------------------------------------------------------------------------------

## Template support code, used once
use-template:

.default-deploy: prep

prep:
	@echo "We can fill telegraf.conf from config here"
