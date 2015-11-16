REMOTE=		akb.io:/var/www/deftly/
LOCAL=		_site/

SITE=	dist/build/site/site

all: sbuild

buildep: build deploy

deploy: sbuild
	rsync -auvz $(LOCAL) $(REMOTE)

sbuild:
	env HS_ENCODING=utf8 $(SITE) build
build:
	cabal build
	cabal run site build

preview:
	cabal run preview 

watch:
	env HS_ENCODING=utf8 $(SITE) watch

clean:
	cabal run site clean
	cabal clean

$(SITE):
	cabal build

rebuild: clean $(SITE)
	$(SITE) clean -v
	$(SITE) rebuild -v
