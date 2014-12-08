module.exports = App.ScaledView = Ember.View.extend
  classNames: ["text-center"]

  didInsertElement: () ->
    $(window).on("resize", () => @resize())
    @resize()

  resize: () ->
    elem = @$()
    elem.css("font-size", elem.width() / 8)
