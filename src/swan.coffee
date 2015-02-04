# This is the main file that will be exported via our package

# GOD should be the only global
# - mutable as SPI (for registering modules in the namespace)
# - immmutable as API (worlds can't modify it directly)

# Things that happen globally
# - global names available to all Worlds
# - classes that shim JavaScript runtime objects

GOD = require './god'

# Will use dependency injection to set properties GOD
GOD.modules =
  World: require './world'

GOD.spawn = (dict) ->
  new GOD.modules.World(dict)

GOD.modules.wrap = require './wrap'
#GOD.modules.syntax = require './syntax'
#GOD.modules.evaluate = require './evaluate'

swan = (js_string) ->
  string = GOD.wrap.do js_string
  result = GOD.evaluate.do string
  result.send 'to_js'

swan.GOD = GOD

module.exports = swan
