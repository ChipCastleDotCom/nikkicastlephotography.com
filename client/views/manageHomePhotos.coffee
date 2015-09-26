Template.manageHomePhotos.onRendered ->
  $.backstretch 'destroy', false

Template.manageHomePhotos.helpers
  items: ->
    HomeItems.find()

Template.manageHomePhotos.events
  'click .button': (event) ->
    $ele = $(event.currentTarget)
    id = $ele.attr 'data-id'
    HomeItems.remove({_id: id})
    return
