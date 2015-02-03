utils =
  runner_world: (property = 'DO', method = sinon.spy()) ->
    world = new TEST_GOD.modules.World
    world[property] = method
    [world, method]

module.exports =
  utils: utils
