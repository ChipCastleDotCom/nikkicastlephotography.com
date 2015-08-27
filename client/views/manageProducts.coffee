Template.manageProducts.helpers
  products: ->
    Products.find()

Template.manageProducts.events
  'click .button': (event) ->
    $ele = $(event.currentTarget)
    id = $ele.attr 'data-id'
    Products.remove({_id: id})
    return
