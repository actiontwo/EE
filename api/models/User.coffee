# User.coffee
#
# @description :: TODO: You might write a short summary of how this model works and what it represents here.
# @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  schema : true
  attributes :
    username :
      type : 'string'
      unique : true
      index : true
      required : true
    password :
      type : 'string'
      required : true

  beforeCreate : (user, cb)->
    if user.password isnt user.confirm_password
      return cb {message : 'Password not match'}
    if  user.password.trim() is ''
      return cb {message : 'Password is null'}
    user.password = bcrypt.hashSync user.password
    cb()

  toJSON : ()->
    obj = this.toObject()
    console.log obj
    delete obj.password
    return obj;



