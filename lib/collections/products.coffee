@Products = new Meteor.Collection 'products'

Schemas.Products = new SimpleSchema
  photo:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProductPhotos'
  filename:
    type: String
  description:
    type: String
  media:
    type: String
    defaultValue: 'print'
    allowedValues: ['print', 'canvas', 'postcard', 'bookmark']

Products.attachSchema(Schemas.Products)
