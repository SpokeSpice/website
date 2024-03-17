publish:
	hugo
	cp -av public/* ../spokespice.github.io/

all: publish
