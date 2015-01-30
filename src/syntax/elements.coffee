elements = (Element) ->
  whitespace:  require('./elements/whitespace')(Element)
  terminal:    require('./elements/terminal')(Element)
  group_open:  require('./elements/group_open')(Element)
  group_close: require('./elements/group_close')(Element)
  unknown:     require('./elements/unknown')(Element)

module.exports = elements
