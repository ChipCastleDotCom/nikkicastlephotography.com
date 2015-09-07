Template.sizeMenu.onCreated ->
  console.log 'sizeMenu onCreated'
  console.dir @data
  NikkiApp.products.set @data._id, media: @data.media, quantity: 1

$(document).on 'change', '[data-size-trigger]', (evt) ->
  console.log 'change'
  name = $(evt.currentTarget).data 'size-trigger'
  size = $(evt.currentTarget).val()
  console.log 'name ', name
  console.log 'size ', size
  menu = NikkiApp.products.get name
  console.log 'menu ', menu
  opts = _.extend menu, size: size
  NikkiApp.products.set name, opts
  console.dir NikkiApp.products.get name
