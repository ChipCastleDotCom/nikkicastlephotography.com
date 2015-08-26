Images.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true
  download: ->
    true

Products.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true

CarouselPhotos.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true
