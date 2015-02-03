# From http://arcturo.github.io/library/coffeescript/03_classes.html
moduleKeywords = ['extended', 'included']

class Module
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value

    obj.extended?.apply(this)
    this

  @include: (obj) ->
    for key, value of obj when key not in moduleKeywords
      # Assign properties to the prototype
      this::[key] = value

    obj.included?.apply(this)
    this

module.exports = Module
