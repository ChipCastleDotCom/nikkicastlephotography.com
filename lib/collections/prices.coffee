@Prices = new Meteor.Collection 'prices'

Schemas.Prices = new SimpleSchema
  media:
    type: String
  amount:
    type: String
  size:
    type: String
    optional: true
  thickness:
    type: String
    optional: true

Prices.attachSchema(Schemas.Prices)

pricesEmpty = ->
  Meteor.isServer and Prices.find().count() == 0

if pricesEmpty()
  #console.log 'Importing Prices'
  #  media         size    thickness   amount
  #
  #  canvas        18x24   0.75        100.00
  #  canvas        18x24   1.50        100.00
  #  canvas        24x18   0.75        100.00
  #  canvas        24x18   1.50        100.00
  #  print         wallet   n/a         10.00
  #  print           4x6    n/a          3.00
  #  print           5x7    n/a          5.00
  #  print          8x10    n/a         10.00
  #  postcard        n/a    n/a          5.00
  #  bookmark        n/a    n/a          5.00
  Prices.insert media: 'canvas', size: '18x24', thickness: 0.75, amount: 100.00
  Prices.insert media: 'canvas', size: '18x24', thickness: 1.50, amount: 100.00
  Prices.insert media: 'canvas', size: '24x18', thickness: 0.75, amount: 100.00
  Prices.insert media: 'canvas', size: '24x18', thickness: 1.50, amount: 100.00
  Prices.insert media: 'print', size: 'wallet', amount: 10.00
  Prices.insert media: 'print', size: '4x6', amount: 3.00
  Prices.insert media: 'print', size: '5x7', amount: 5.00
  Prices.insert media: 'print', size: '8x10', amount: 10.00
  Prices.insert media: 'postcard', amount: 5.00
  Prices.insert media: 'bookmark', amount: 5.00
