UI.registerHelper 'photo', (row) ->
  console.dir row
  id = row.photo
  photo = Photos.findOne(_id: id)
  photo.url() if photo
