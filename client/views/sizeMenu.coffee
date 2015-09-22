Template.sizeMenu.events
  'change .item-size': (evt) ->
    console.log 'change .item-size'
    #id = $(evt.currentTarget).data 'size-trigger'
    #console.log 'id ', id
    #media = $(evt.currentTarget).data 'media-trigger'
    #console.log 'media', media
    #size = $(evt.currentTarget).val()
    #console.log 'size ', size
    #product = NikkiApp.products.get id
    #console.dir product
    #opts = _.extend product, size: size
    #console.log 'opts ', opts
    #NikkiApp.products.set id, opts
