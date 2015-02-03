# Scoped Worlds Abstraction Notation
#
# In the actual SWAN language there will be syntax
# for many of these things.
# But for now, everything is a property of some World (or TEST_GOD)
# There are no keywords. no built-ins that are always accessible
# You can only access items in your scope
# And if your parent blocks GOD you can't even access that
#
# The reason is THE hard problem of computation is 'effect'
# -> Who gets to change What (and When)
#
# This implies that the truth about anything lives in
# precisely one place in the hierarchy.
# Thus you need robust and flexible mechanism for creating and
# accessing proxies/tunnels with appropiate permissions.

World = TEST_GOD.modules.World

describe 'World', ->
  world    = null
  contents = { }

  beforeEach -> world = new World contents
