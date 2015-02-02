class Output extends Call
  # Conversions

  toJSON: ->
    @get('to_json')(this)

  toS: ->
    @get('to_s')(this)

end

