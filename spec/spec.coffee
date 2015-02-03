global.puts      = console.log
global.expect    = require('chai').expect
global.sinon     = require 'sinon'
global.specUtils = require('./spec_helper').utils
global.swan      = require '../src/swan'
global.TEST_GOD  =  require '../src/god'

require_tree = require 'require-tree'
# require_tree './'

require './wrap/nil_spec'