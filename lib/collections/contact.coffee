Schemas.contact = new SimpleSchema
  name:
    type: String
  phone:
    type: String
  email:
    type: String
  note:
    type: String
    optional: true
    autoform:
      rows: 3
