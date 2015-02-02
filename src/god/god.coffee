#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#

# Each module defines methods on GOD that it relies upon

# Semantic objects append to semantics
# Syntax

SwanString = require './worlds/string'

module.exports =
  type: 'GOD'
  semantics: Route()
  syntax: Route()


###
# In World
GOD.semantics.push
  predicate: (object) -> object instanceof World
  generator: (object) -> object

# In string.coffee

GOD.semantics.push
  predicate: (object) -> typeof object == 'string'
  generator: (object) -> SwanString object

GOD.to_s: (object) -> SwanString object

# Used via
God.semantics.do input # -> result
###


