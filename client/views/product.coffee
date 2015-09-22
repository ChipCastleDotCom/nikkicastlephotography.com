Template.product.onCreated ->
  media = @data.media
  size = '4x6'
  #service = NikkiApp.productService media: media, size: size

  quantity = 1
  #sizes = service.sizes()
  #size = sizes[0]

  @currentProduct = new ReactiveVar media: media, quantity: quantity, size: size
  @hasSizes = new ReactiveVar _.contains ['print', 'canvas'], media
  menuOptions = NikkiApp.productService(media: media).sizes()
  @sizes = new ReactiveVar menuOptions
  #sizes = NikkiApp.productService(media: product.media).sizes()
  #sizes.length > 0

  #console.log 'product.onCreated NikkiApp.products.set %s, media: %s, quantity: %s, size: %s', @data._id, media, quantity, size
  console.log 'product.onCreated'
  #NikkiApp.products.set @data._id, media: media, quantity: quantity, size: size

#Template.product.onRendered ->
  #console.log 'product.onRendered @data'
  #console.dir @data
  #console.log 'product.onRendered'
  #console.dir @currentProduct

#UI.registerHelper 'hasSizesFor', (product) ->
  #console.log 'hasSizesFor '
  ##sizes = NikkiApp.productService(media: product.media).sizes()
  ##sizes.length > 0
  #Template.instance.hasSizes().get()

Template.product.helpers
  hasSizes: ->
    console.log 'product.helpers hasSizes'
    value = Template.instance().hasSizes.get()
    console.log 'hasSizes ', value
    value

  sizes: ->
    console.log 'product.helpers sizes'
    value = Template.instance().sizes.get()
    console.log 'sizes ', value
    value

Template.product.events
  'change': (evt, template) ->
    #console.log 'change product'
    value = $(evt.currentTarget).val()
    #console.log 'value ', value
    data = $(evt.currentTarget).data()
    id = undefined

    if data.quantityTrigger
      id = data.quantityTrigger
      options = quantity: value
    else if data.mediaTrigger
      id = data.mediaTrigger
      options = media: value
    else if data.sizeTrigger
      id = data.sizeTrigger
      options = size: value
    else if data.thicknessTrigger
      id = data.thicknessTrigger
      options = thickness: value

    if id
      console.log 'change product NikkiApp.products.set %s', id
      #product = NikkiApp.products.get id
      product = template.currentProduct.get()
      #hasSizes = template.hasSizes.get()
      console.dir product
      newOptions = _.extend product, options
      console.log 'newOptions'
      console.dir newOptions
      template.currentProduct.set newOptions
      value = _.contains ['print', 'canvas'], product.media
      template.hasSizes.set value
      console.log 'after template.hasSizes.set ', value
      menuOptions = NikkiApp.productService(media: product.media).sizes()
      template.sizes.set menuOptions
      #console.log 'before NikkiApp.products.set %s', id
      #NikkiApp.products.set id, newOptions
      #console.log 'after NikkiApp.products.set %s', id

  'keyup .item_quantity': (evt, template) ->
    id = $(evt.currentTarget).data 'quantity-trigger'
    console.log 'keyup .item_quantity id ', id
    quantity = $(evt.currentTarget).val()
    console.log 'quantity ', quantity
    product = template.currentProduct.get()
    opts = _.extend product, quantity: quantity
    console.dir opts
    NikkiApp.products.set id, opts
