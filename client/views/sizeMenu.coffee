Template.sizeMenu.events
  'change .item_size': (evt) ->
    name = $(evt.currentTarget).data 'size-trigger'
    size = $(evt.currentTarget).val()
    product = NikkiApp.products.get name
    opts = _.extend product, size: size
    NikkiApp.products.set name, opts
