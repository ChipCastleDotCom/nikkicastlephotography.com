Products.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true

ProductPhotos.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true
  download: ->
    true

CarouselItems.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true

CarouselPhotos.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true
  download: ->
    true

HomeItems.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true

HomePhotos.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true
  download: ->
    true
