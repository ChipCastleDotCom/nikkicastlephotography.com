UI.registerHelper 'productPhoto', (product) ->
  id = product.photo
  photo = ProductPhotos.findOne _id: id
  photo.url() if photo

UI.registerHelper 'carouselPhoto', (carouselItem) ->
  id = carouselItem.photo
  photo = CarouselPhotos.findOne _id: id
  photo.url() if photo
