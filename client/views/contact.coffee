Template.contact.helpers contactFormSchema: ->
  Schemas.contact

Template.contact.onRendered ->
  $.backstretch 'destroy', false
