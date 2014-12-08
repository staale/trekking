module.exports = App.ColorCheckerComponent = Ember.Component.extend
  tagName: "i"
  animate: 0
  classNames: ["fa"]
  classNameBindings: ["checked:fa-check-circle-o:fa-circle-o"]
  attributeBindings: ["style"]
  color: null
  oldColor: "#000000"
  values: []
  action: "toggle"
  style: ""
  effect: "bounceOut"

  didInsertElement: ->
    @$().css("color", @get("color.color"))

  keepOldColor: ( ->
    @set("oldColor", @get("color.color"))
  ).observesBefore("color")

  styleAnimation: ( ->
    @$().tween
      color:
        time: 0
        start: @get("oldColor")
        stop: @get("color.color")
        duration: @get("animate")
        effect: @get("effect")

    $.play()

  ).observes("color")



  checked: ( ->
    @get("values").contains(@get("color"))
  ).property("color", "values.@each")
