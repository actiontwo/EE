###
Bootstrap
(sails.config.bootstrap)

An asynchronous bootstrap function that runs before your Sails app gets lifted.
This gives you an opportunity to set up your data model, run jobs, or perform some special logic.

For more information on bootstrapping your app, check out:
http://sailsjs.org/#!/documentation/reference/sails.config/sails.config.bootstrap.html
###
module.exports.bootstrap = (cb) ->
  User.find().exec (error, users)->
    if users.length is 0
      User.create(
        username : 'admin'
        password : 'admin'
        confirm_password : 'admin'
      ).exec (error, user)->
        sails.log.error error if error
        sails.log.info 'user was created success', user

  # It's very important to trigger this callback method when you are finished
  # with the bootstrap!  (otherwise your server will never lift, since it's waiting on the bootstrap)
  cb()