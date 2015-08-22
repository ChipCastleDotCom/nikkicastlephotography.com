Template.images.helpers
  images: ->
    Images.find()

Template.images.events
  'click .button': (event) ->
    $ele = $(event.currentTarget)
    id = $ele.attr 'data-id'
    Images.remove({_id: id})
    return
