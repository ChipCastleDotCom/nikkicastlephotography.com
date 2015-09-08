@CarouselItems = new Meteor.Collection 'carouselitems'

Schemas.CarouselItems = new SimpleSchema
  dateOfPhoto:
    type: Date
    defaultValue: new Date()
  photo:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'CarouselPhotos'

CarouselItems.attachSchema(Schemas.CarouselItems)
