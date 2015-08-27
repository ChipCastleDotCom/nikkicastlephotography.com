@Products = new Meteor.Collection 'products'

Schemas.Products = new SimpleSchema
  filename:
    type: String
  media:
    type: String
    defaultValue: 'print'
    allowedValues: ['print', 'canvas']
  tags:
    type: String
  photo:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProductPhotos'

Products.attachSchema(Schemas.Products)
