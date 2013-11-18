module.exports = App.IndexRoute = Ember.Route.extend
  model: ->
    App.Setup.create()
