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
    autoform:
      afFieldInput:
        type: 'hidden'
  postcard:
    type: Boolean
    label: 'Available for sale as a Postcard'
  bookmark:
    type: Boolean
    label: 'Available for sale as a Bookmark'
  dateOfPhoto:
    type: Date
    defaultValue: new Date()

Products.attachSchema(Schemas.Products)
