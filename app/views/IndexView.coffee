module.exports = App.IndexView = Ember.View.extend

  didInsertElement: () ->
    $(window).on "keypress.indexView click.indexView", (e) =>
      target = $(e.target)
      console.log(e.target, e.target.tagName, target.parents(".play"))
      if target.parents(".play").length || !target.parents(".container").length
        if (e.type == "click" || e.keyCode == 13)
          @get("controller").send("nextDraw")


  destroy: () ->
    $(window).off(".indexView")
