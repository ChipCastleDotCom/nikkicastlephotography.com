Template.manageProducts.onRendered ->
  $.backstretch 'destroy', false

Template.manageProducts.helpers
  products: ->
    Products.find()

Template.manageProducts.events
  'click .button': (event) ->
    $ele = $(event.currentTarget)
    id = $ele.attr 'data-id'
    Products.remove({_id: id})
    return

  'change .js-file': (event) ->
    imageFilename = event.currentTarget.files[0].name
    $("input[name='filename']").val(imageFilename)
