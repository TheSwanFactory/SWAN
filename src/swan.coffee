# This is the main file that will be exported via our package

global.GOD = require './god/god'
global.World = require './world/world'

# GOD should be the only global
# - mutable as SPI (for registering modules in the namespace)
# -- immmutable as API (worlds can't modify it directly)

# Things that happen globally
# - global names available to all Worlds
# - classes that shim JavaScript runtime objects

module.exports = swan = (code) ->
    # take code, evaluate it
