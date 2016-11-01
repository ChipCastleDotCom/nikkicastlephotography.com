Template.home.onRendered ->
  backstretchPhotos = []

  photos = HomeItems.find({}).fetch()
  if photos.length
    _.each photos, (obj) ->
      photo = HomePhotos.findOne _id: obj.photo
      if photo
        file = '/cfs/files/homephotos/' + photo.copies['homephotos'].key
        backstretchPhotos.push file
  else
    backstretchPhotos = [
      '/images/lakemood9.jpg'
      '/images/oceammoods8.jpg'
      '/images/oceanmoodcanvas.jpg'
      '/images/lakemoods4.jpg'
      '/images/oceanmood3.jpg'
    ]
  $.backstretch backstretchPhotos,
    duration: 3000
    fade: 750
