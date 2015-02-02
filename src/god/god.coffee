#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#
# Each module defines properties on GOD that it relies upon
#
# Use 'push' to inject worlds into the appropriate global namespace
# Use 'do' to iterate through those worlds

#World = require '../world/world'

GOD =
  label: 'GOD'
  type: 'GOD'
  # May need more specialized types
  evaluate: new Pipe() # chain transformations together to evaluate SwanStrings
  wrap: new Route() # choose which World to instantiate for JavaScript objects
  syntax: new Route() # choose which Syntax to instantiate for SwanSymbol Chars

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


