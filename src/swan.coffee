# This is the main file that will be exported via our package

global.World = require './world'

module.exports = swan = (code) ->
    # take code, evaluate it
