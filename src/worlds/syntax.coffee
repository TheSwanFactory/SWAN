#module.exports = class Syntax extends World

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
    