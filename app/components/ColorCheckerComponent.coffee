module.exports = App.ColorCheckerComponent = Ember.Component.extend
  tagName: "i"
  classNames: ["fa", "fa-2x"]
  classNameBindings: ["checked:fa-check-circle-o:fa-circle-o"]
  attributeBindings: ["style"]
  color: null
  values: []
  action: "toggle"

  style: (() ->
    "color: #{@get("color.color")}"
  ).property("value")

  checked: (() ->
    @get("values").contains(@get("color"))
  ).property("color", "values.@each")
