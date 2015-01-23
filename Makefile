PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean build test dist publish

default: clean init build test

init:
	npm install

clean:
	rm -rf build/ test/*.js

build:
	mkdir -p build
	coffee -p -c src/ > build/swan.js

test:
	./node_modules/.bin/mocha --opts mocha.opts

test-watch:
	./node_modules/.bin/mocha --opts mocha.opts --watch

publish: dist
	npm publish
