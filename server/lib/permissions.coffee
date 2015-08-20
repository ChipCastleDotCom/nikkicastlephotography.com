Images.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true
  download: ->
    true

Prints.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true
