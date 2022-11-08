# -*- mode: makefile; fill-column: 78; comment-column: 50; tab-width: 2 -*-

# get the rood directory of the Makefile
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: site

site:
## site: generate output via hugo
	hugo

clean:
## clean: whack all targets
	rm $(ROOT_DIR)/public/*


# push explicitly doesn't require other elements to be built
push:
# ## push: push the currently built version of the site to remote host
# 	echo "pushing, we assume you've put everything in place ..."
# 	rsync -ave 'ssh -p 22' --delete-after $(RSYNC_SRC) $(RSYNC_DST)

serve:
## serve: launch hugo with server
	echo "starting local server"
	hugo serve

serve-remote:
## serve-remote: launch hugo on all IPv4 interfaces. resolve on $HOSTNAME.local
	echo "starting server"
	hugo serve --bind 0.0.0.0 -b http://$(HOSTNAME).local.

help:
## help: prints this help message
	@echo "usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
