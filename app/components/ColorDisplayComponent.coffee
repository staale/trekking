module.exports = App.ColorDisplayComponent = Ember.Component.extend
  tagName: "i"
  classNames: ["fa", "fa-2x"]
  classNameBindings: ["icon"]
  attributeBindings: ["style"]
  icon: "fa-circle"
  value: null

  style: (() ->
    "color: #{@get("value.color")}"
  ).property("value")

