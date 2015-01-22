PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean build test dist publish

default: clean init build test

init:
	npm install

clean:
	rm -rf build/ test/*.js

build:
	coffee -o build/ -c src/

test:
	mocha --opts mocha.opts

test-watch:
	mocha --opts mocha.opts --watch

publish: dist
	npm publish
