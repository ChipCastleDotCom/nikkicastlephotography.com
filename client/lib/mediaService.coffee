NikkiApp.mediaService = ({product} = {product: ''}) ->

  typesAvailable = ->
    types = ['print', 'canvas']
    types.push 'postcard' if product.postcard
    types.push 'bookmark' if product.bookmark
    types

  Object.freeze
    typesAvailable: typesAvailable
