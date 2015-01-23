utils =
  runner_world: (property = 'DO', method = sinon.spy()) ->
    world = new World
    world[property] = method
    [world, method]

module.exports =
  utils: utils
