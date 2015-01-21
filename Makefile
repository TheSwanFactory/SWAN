PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean build test dist publish

init:
	npm install

clean:
	rm -rf build/ test/*.js

build:
	coffee -o build/ -c src/

test:
	mocha --opts mocha.opts

dist: clean init build test

publish: dist
	npm publish
