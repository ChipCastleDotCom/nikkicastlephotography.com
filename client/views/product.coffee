Template.product.onCreated ->
  media = @data.media
  service = NikkiApp.productService media: media

  quantity = service.quantity or 1
  sizes = service.sizes()
  size = sizes[0]

  NikkiApp.products.set @data._id, media: media, quantity: quantity, size: size
