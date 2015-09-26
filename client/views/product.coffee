setAmount = (template) ->
  media = template.item.get 'media'
  size = template.item.get 'size'
  service = NikkiApp.productService(media: media, size: size)
  template.item.set 'amount', service.amount()
  return

Template.product.onCreated ->
  media = 'print'
  size = '4x6'
  amount = NikkiApp.productService(media: media, size: size).amount()

  @item = new ReactiveDict()
  @item.set 'media', media
  @item.set 'size', size
  @item.set 'quantity', 1
  @item.set 'amount', amount
  @item.set 'filename', @data.filename

Template.product.helpers
  itemName: ->
    filename = Template.instance().item.get('filename')
    media = Template.instance().item.get('media')
    size = Template.instance().item.get('size')
    thickness = Template.instance().item.get('thickness')
    itemName = "#{filename}-#{media}-#{size}"
    itemName += "-#{thickness}" if thickness
    itemName

  sizes: ->
    media = Template.instance().item.get('media')
    NikkiApp.productService(media: media).sizes()

  thicknesses: ->
    media = Template.instance().item.get('media')
    NikkiApp.productService(media: media).thicknesses()

  amount: ->
    amount = Template.instance().item.get('amount')
    numeral(amount).format('$0,0.00')

  itemTotal: ->
    amount = Template.instance().item.get('amount')
    quantity = Template.instance().item.get('quantity')
    numeral(amount * quantity).format('$0,0.00')

Template.product.events
  'change .item_media': (evt, template) ->
    media = $(evt.currentTarget).val()
    template.item.set 'media', media

    size = template.item.get 'size'
    service = NikkiApp.productService(media: media, size: size)

    if media == 'canvas'
      template.item.set 'thickness', '0.75'
      unless _.contains ['18x24', '24x18'], size
        template.item.set 'size', '18x24'
    else if media == 'print'
      template.item.set 'thickness', ''
      unless _.contains ['4x6', '5x7', '8x10', 'wallet'], size
        template.item.set 'size', '4x6'
    else
      template.item.set 'thickness', ''
      template.item.set 'size', ''

    template.item.set 'amount', service.amount()
    return

  'change .item_size': (evt, template) ->
    size = $(evt.currentTarget).val()
    template.item.set 'size', size
    setAmount(template)
    return

  'change .item_thickness': (evt, template) ->
    thickness = $(evt.currentTarget).val()
    template.item.set 'thickness', thickness

  'keyup .item_quantity': (evt, template) ->
    quantity = $(evt.currentTarget).val()
    template.item.set 'quantity', quantity
    setAmount(template)
    return

  'click .simpleCart_empty': (evt, template) ->
    NikkiApp.products = {}
    return
