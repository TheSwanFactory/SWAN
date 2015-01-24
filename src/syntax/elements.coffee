elements = (Element) ->
  whitespace: require('./elements/whitespace')(Element)
  unknown:    require('./elements/unknown')(Element)

module.exports = elements
