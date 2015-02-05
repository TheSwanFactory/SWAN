#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#
# GOD does not depend on anytyhing
# Each module defines properties on GOD that it relies upon
#

extend = require 'extend'

GOD =
  label:   'GOD'
  type:    'GOD'
  globals:
    label: 'globals'

  extend: (dict) ->
    extend GOD.globals, dict

###
  Defined by dependency injection
  - evaluate: new Pipe() # chain transformations together to evaluate SwanStrings
  - wrap: new Route() # choose which World to instantiate for JavaScript objects
  - syntax: new Route() # choose which Syntax to instantiate for SwanSymbol Chars

  Use 'push' to inject worlds into the appropriate global namespace
  Use 'do' to iterate through those worlds
###

module.exports = GOD


###
# In World
  GOD.semantics.push
    predicate: (object) -> object instanceof World
    generator: (object) -> object

# In string.coffee

GOD.semantics.push SwanString

# SwanString takes an object
# has an "accepts" method for validating arguments
# which is always checked on 'do'
# implies a 'has-type' predicate on every world

GOD.to_s: (object) -> SwanString object

# Used via
God.semantics.do input # -> result
###
