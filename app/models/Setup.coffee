module.exports = App.Setup = Ember.Object.extend
  colors: null
  min: 1
  max: 999
  pickNo: 0
  availablePicks: null

  currentPick: (() ->
    @get("availablePicks").objectAt(@get("pickNo"))
  ).property("availablePicks.@each", "pickNo")

  history: (() ->
    @get("availablePicks").slice(0, @get("pickNo"))
  ).property("availablePicks.@each", "pickNo")

  multiColor: (() ->
    console.log("Multicolor: %s, %s", @get("colors.length"), @get("colors.length") > 1)
    @get("colors.length") > 1
  ).property("colors.@each")

  init: () ->
    @_super()
    @set("colors", App.Color.available())
    @set("availablePicks", [])

  shuffle: () ->
    picks = []

    @get("colors").map (color) =>
      App.Pick.create(
        color: color
        number: n
      ) for n in [@get("min")..@get("max")]
    .forEach (pickCollection) ->
      Array::push.apply picks, pickCollection

    if picks.length == 0
      picks = ([@get("min")..@get("max")]).map((n) -> App.Pick.create(
        number: n
      ))

    for idx in [0..(picks.length-1)]
      swap = idx + Math.floor(Math.random() * (picks.length - idx))
      [picks[idx], picks[swap]] = [picks[swap], picks[idx]]

    @set("availablePicks", picks)
    @set("pickNo", 0)

