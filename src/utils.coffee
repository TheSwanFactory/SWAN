utils =
  memoize: (func) ->
    memo = null
    ->
      memo ||= func()

module.exports = utils
