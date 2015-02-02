utils =
  memoize: (func) ->
    memo = null
    ->
      memo ||= func()

  array_last: (array) ->
    array[array.length - 1]

module.exports = utils
