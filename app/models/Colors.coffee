module.exports = App.Color = Ember.Object.extend
  color: null
  name: ""

color = (name, rgb) -> App.Color.create
  color: rgb
  name: name

ALL_COLORS = [
  color("Blå", "#5bc0de")
  color("Gul", "#f0ad4e")
  color("Rød", "#d9534f")
  color("Grønn", "#5cb85c")
]

App.Color.reopenClass
  available: () -> ALL_COLORS