Template.product.onCreated ->
  media = @data.media
  size = '4x6'

  quantity = 1

  @currentProduct = new ReactiveVar media: media, quantity: quantity, size: size
  @hasSizes = new ReactiveVar _.contains ['print', 'canvas'], media
  menuOptions = NikkiApp.productService(media: media).sizes()
  @sizes = new ReactiveVar menuOptions

Template.product.helpers
  hasSizes: ->
    Template.instance().hasSizes.get()

  sizes: ->
    Template.instance().sizes.get()

Template.product.events
  'change': (evt, template) ->
    value = $(evt.currentTarget).val()
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
      product = template.currentProduct.get()
      newOptions = _.extend product, options
      template.currentProduct.set newOptions
      value = _.contains ['print', 'canvas'], product.media
      template.hasSizes.set value
      menuOptions = NikkiApp.productService(media: product.media).sizes()
      template.sizes.set menuOptions

  'keyup .item_quantity': (evt, template) ->
    id = $(evt.currentTarget).data 'quantity-trigger'
    quantity = $(evt.currentTarget).val()
    product = template.currentProduct.get()
    opts = _.extend product, quantity: quantity
    NikkiApp.products.set id, opts
