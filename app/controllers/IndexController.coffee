ColorInfo = Ember.Object.extend
  color: null
  setup: null
  checked: (() ->
    @get("setup.colors").getEach("name").contains(@get("color.name"))
  ).property("color", "setup.colors.@each")

module.exports = App.IndexController = Ember.ObjectController.extend
  setup: true

  colors: (() ->
    App.Color.available().map (color) =>
      ColorInfo.create
        color: color
        setup: @get("model")
  ).property()

  actions:
    toggle: (color) ->
      if @get("model.colors").contains(color)
        @get("model.colors").removeObject(color)
      else
        @get("model.colors").pushObject(color)

    start: () ->
      @get("model").shuffle()
      @set("setup", false)

    setup: () ->
      @set("setup", true)

    nextDraw: () ->
      unless @get("setup")
        @incrementProperty("model.pickNo")
