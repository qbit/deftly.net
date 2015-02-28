REMOTE=		akb.io:/var/www/deftly/
LOCAL=		_site/

all: build

buildep: build deploy

deploy:
	rsync -auvz $(LOCAL) $(REMOTE)

build:
	cabal build
	cabal run site build

preview:
	cabal run preview 

watch:
	cabal run watch

clean:
	cabal run site clean
	cabal clean

SITE=	dist/build/site/site
$(SITE):
	cabal build

rebuild: clean $(SITE)
	$(SITE) clean -v
	$(SITE) rebuild -v
