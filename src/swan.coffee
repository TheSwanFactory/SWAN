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
  world: require './world'
#  wrap: require './wrap'
#  syntax: require './syntax'
#  evaluate: require './evaluate'

module.exports = swan = (js_string) ->
  string = God.wrap.do js_string
  result = GOD.evaluate.do string
  result.send 'to_js'
