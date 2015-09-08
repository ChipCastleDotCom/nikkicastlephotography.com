Meteor.loginAsAdmin = (password, callback) ->
  # Create a login request with admin: true, so our loginHandler can
  # handle this request
  loginRequest =
    admin: true
    password: password
  # Send the login request
  Accounts.callLoginMethod
    methodArguments: [ loginRequest ]
    userCallback: callback
  return
