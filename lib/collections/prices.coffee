@Prices = new Meteor.Collection 'prices'

Schemas.Prices = new SimpleSchema
  media:
    type: String
  size:
    type: String
  thickness:
    type: String
  price:
    type: String

Prices.attachSchema(Schemas.Prices)

#  media         size    thickness   price
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
