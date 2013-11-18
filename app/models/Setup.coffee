module.exports = App.Setup = Ember.Object.extend
  colors: null
  min: 1
  max: 999
  availablePicks: null
  selectedPicks: null
  lastPick: Ember.computed.alias("selectedPicks.lastObject").property("selectedPicks.@each")

  init: () ->
    @_super()
    @set("colors", App.Color.available())
    @set("availablePicks", [])
    @set("selectedPicks", [])

  shuffle: () ->
    picks = []
    console.log(picks.length, @get("colors").map)

    @get("colors").map (color) =>
      App.Pick.create(
        color: color
        number: n
      ) for n in [@get("min")..@get("max")]
    .forEach (pickCollection) ->
      Array::push.apply picks, pickCollection

    console.log(picks.length)
    for idx in [0..(picks.length-1)]
      swap = idx + Math.floor(Math.random() * (picks.length - idx))
      [picks[idx], picks[swap]] = [picks[swap], picks[idx]]
    console.log(picks.length)
    @set("availablePicks", picks)
    @set("selectedPicks", [picks[0]])

