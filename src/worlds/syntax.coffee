#module.exports = class Syntax extends World
#
###

a factory that creates things that point up to a base charWorld instance

###

module.exports = (out) ->
 me = new World (out)
 me.type = "Syntax"
 me.prop = "whatever"
 me.doer = -> console.log "doer"
 me.child = ->
  mine = me.sub()
  mine.do(SwanString 'foo')
 me

# Syntax = require 'syntax'
# users call Syntax(out) => <#World {type: 'Syntax', prop: 'whatever'}>
    
