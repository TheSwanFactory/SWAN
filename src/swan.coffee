# This is the main file that will be exported via our package

# GOD should be the only global
# - mutable as SPI (for registering modules in the namespace)
# - immmutable as API (worlds can't modify it directly)

# Things that happen globally
# - global names available to all Worlds
# - classes that shim JavaScript runtime objects

global.GOD = require './god/god'
global.World = require './world/world' # want to remove this

# recursively require subdirectories
# Call GOD.init.do() (?)

module.exports = swan = (js_string) ->
  string = God.wrap.do js_string 
  result = GOD.evaluate.do string
  result.call('to_js')
