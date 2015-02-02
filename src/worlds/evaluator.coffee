###
Evaluator takes a tree of expressions and emits a tree of values
###

Evaluator = new World
  type: 'Evaluator'

factory = (out) ->
  Evaluator.sub
    out: out

module.exports = factory
