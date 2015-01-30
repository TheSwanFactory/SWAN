elements = (Element) ->
  whitespace:    require('./elements/whitespace')(Element)
  terminal:      require('./elements/terminal')(Element)
  closure_open:  require('./elements/closure_open')(Element)
  closure_close: require('./elements/closure_close')(Element)
  unknown:       require('./elements/unknown')(Element)

module.exports = elements
