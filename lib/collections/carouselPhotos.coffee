@CarouselPhotos = new Meteor.Collection 'carouselphotos'

Schemas.CarouselPhotos = new SimpleSchema
  picture:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Images'

CarouselPhotos.attachSchema(Schemas.CarouselPhotos)
