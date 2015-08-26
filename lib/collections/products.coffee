@Products = new Meteor.Collection 'products'

Schemas.Prodcuts = new SimpleSchema
  filename:
    type: String
  media:
    type: String
    defaultValue: 'print'
    allowedValues: ['print', 'canvas']
  tags:
    type: String
  picture:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Images'

Products.attachSchema(Schemas.Products)
