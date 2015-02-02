class Call extends Scope

  OUT: ->
    @get 'out'

  # invocation

  # 'DO' is the SPI on World
  # 'do' is the actual SPI, which is SWAN-inherited
  DO: (args) ->
    @get('do')(this, args)

  DONE: (args) ->
    @get('done')(this, args)

  emit: (args) ->
    # sends to out if it exists
    # else prints to console.lorg

  call: (property, args) ->
    method = @get property
    if method? && typeof method == 'function'
      method this, args
    else
      throw new Error("#{property} is not a valid method")
end
