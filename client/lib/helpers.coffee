UI.registerHelper 'productPhoto', (product, thumbnail) ->
  id = product.photo
  photo = ProductPhotos.findOne _id: id
  if photo
    store = if thumbnail.hash.thumb then 'productthumbnails' else 'productphotos'
    photo.url(store: store)

UI.registerHelper 'carouselPhoto', (carouselItem, thumbnail) ->
  id = carouselItem.photo
  photo = CarouselPhotos.findOne _id: id
  if photo
    store = if thumbnail.hash.thumb then 'carouselthumbnails' else 'carouselphotos'
    photo.url(store: store)

UI.registerHelper 'addIndex', (all) ->
  _.map all, (val, index) ->
    {
      index: index
      value: val
    }

UI.registerHelper 'firstIndex', (index) ->
  index == 0

UI.registerHelper 'cssClass', (index) ->
  if index == 0 then 'active' else ''

UI.registerHelper 'priceFor', (media) ->
  price = Prices.findOne({media: media})
  numeral(price.amount).format('$0,0.00')

UI.registerHelper 'sizeFor', (media) ->
  price = Prices.findOne({media: media})
  price.size

UI.registerHelper 'sizesMenuFor', (media) ->
  return if media not in ['print', 'canvas']
  Prices.find({media: media}, {_id: 0, size: 1}).fetch()

UI.registerHelper 'thicknessMenuFor', (media) ->
  return if media != 'canvas'
  Prices.find({media: 'canvas'}, {_id: 0, thickness: 1}).fetch()
