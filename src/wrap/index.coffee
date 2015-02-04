# index of wrappers

# Each wrapper must:
# - push a typed world into GOD.wrap
# - export a function that creates a World
# - set additional properties on GOD if necessary

GOD = require '../god'

wrap =
  nil:  require './nil'
  char: require './char'

module.exports = wrap
