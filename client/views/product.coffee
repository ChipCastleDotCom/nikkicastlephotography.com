Template.product.onCreated ->
  size = '4x6'
  quantity = 1
  @size = new ReactiveVar size
  @quantity = new ReactiveVar quantity
  productOptions = media: @data.media, size: size, quantity: quantity

  @filename = new ReactiveVar @data.filename
  @currentProduct = new ReactiveVar productOptions

  menuOptions = NikkiApp.productService media: @data.media, size: size
  @thicknesses = new ReactiveVar menuOptions.thicknesses()
  @sizes = new ReactiveVar menuOptions.sizes()
  @amount = new ReactiveVar menuOptions.amount()

Template.product.helpers
  itemName: ->
    filename = Template.instance().filename.get()
    item = Template.instance().currentProduct.get()
    itemName = "#{filename}-#{item.media}-#{item.size}"
    itemName += "-#{item.thickness}" if item.thickness
    itemName

  sizes: ->
    Template.instance().sizes.get()

  thicknesses: ->
    Template.instance().thicknesses.get()

  amount: ->
    amount = Template.instance().amount.get()
    numeral(amount).format('$0,0.00')

  itemTotal: ->
    amount = Template.instance().amount.get()
    quantity = Template.instance().quantity.get()
    numeral(amount * quantity).format('$0,0.00')

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
      #NikkiApp.products.set id, _.extend product, options
      template.currentProduct.set = _.extend product, options

      size = template.size.get()
      menuOptions = NikkiApp.productService media: product.media, size: size
      template.sizes.set menuOptions.sizes()
      template.thicknesses.set menuOptions.thicknesses()
      template.amount.set menuOptions.amount()

  'keyup .item_quantity': (evt, template) ->
    id = $(evt.currentTarget).data 'quantity-trigger'
    quantity = $(evt.currentTarget).val()
    template.quantity.set quantity

  'click .item_add': (evt, template) ->
    console.log 'click .item_add'

    # Fetch id
    id = template.data._id
    console.log 'update product with id ', id
    # Fetch product
    product = template.currentProduct.get()
    # Set ReactiveDict for products using generated id
    #NikkiApp.products.set id, product

    # Generate an id
    #randomId = Random.id()
    #console.log 'Random id ', randomId

    ## Update DOM in 3 places
    #template.data._id = randomId
    #console.log 'after template.data._id'
    #console.dir template.data

  'click .simpleCart_empty': (evt, template) ->
    console.log 'click .simpleCart_empty'
    NikkiApp.products = {}
