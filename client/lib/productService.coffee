# TODO Rename to productMenu
# TODO Accept a product as an arg
NikkiApp.productService = ({media, size} = {media: '', size: ''}) ->

  amount = ->
    return '100.00' if media == 'canvas'
    return '5.00' if media in ['postcard', 'bookmark']
    if media == 'print'
      return '10.00' if size in ['8x10', 'wallet']
      return '5.00' if size == '5x7'
    '3.00'

  sizes = ->
    return ['18x24', '24x18'] if media == 'canvas'
    return ['4x6', '5x7', '8x10', 'wallet'] if media == 'print'
    []

  thicknesses = ->
    return ['0.75', '1.5'] if media == 'canvas'
    []

  Object.freeze
    amount: amount
    sizes: sizes
    thicknesses: thicknesses
