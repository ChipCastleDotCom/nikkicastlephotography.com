Meteor.methods sendEmail: (doc) ->
  process.env.MAIL_URL = 'smtp://localhost'

  check doc, Schemas.contact
  text = 'Name: ' + doc.name + '\n\n'
  text += 'Email: ' + doc.email + '\n\n' if doc.email
  text += 'Phone: ' + doc.phone + '\n\n' if doc.phone
  text += 'Note: ' + doc.note + '\n\n' if doc.note

  @unblock()

  Email.send
    to: 'chip@chipcastle.com'
    from: doc.email
    subject: 'Nikki Castle Photography Contact Form - Message From ' + doc.name
    text: text
  return
