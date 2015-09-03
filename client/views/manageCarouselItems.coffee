Template.manageCarouselItems.onRendered ->
  $.backstretch 'destroy', false

Template.manageCarouselItems.helpers
  items: ->
    CarouselItems.find()

Template.manageCarouselItems.events
  'click .button': (event) ->
    $ele = $(event.currentTarget)
    id = $ele.attr 'data-id'
    CarouselItems.remove({_id: id})
    return
