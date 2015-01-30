elements = (Element) ->
  whitespace: require('./elements/whitespace')(Element)
  terminal:   require('./elements/terminal')(Element)
  unknown:    require('./elements/unknown')(Element)

module.exports = elements
