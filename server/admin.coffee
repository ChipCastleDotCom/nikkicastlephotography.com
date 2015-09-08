Accounts.registerLoginHandler (loginRequest) ->
  if !loginRequest.admin
    return null
  unless Meteor.settings.public.adminPassword
    return null
  if loginRequest.password != Meteor.settings.public.adminPassword
    return null
  userId = null
  user = Meteor.users.findOne(username: 'admin')
  if !user
    userId = Meteor.users.insert(username: 'admin')
  else
    userId = user._id
  # Creating the token and adding to the user
  stampedToken = Accounts._generateStampedLoginToken()
  hashStampedToken = Accounts._hashStampedToken(stampedToken)
  Meteor.users.update userId, $push: 'services.resume.loginTokens': hashStampedToken
  # Sending token along with the userId
  {
    userId: userId
    token: stampedToken.token
  }
