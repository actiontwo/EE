 # AuthenticationController
 #
 # @description :: Server-side logic for managing authentications
 # @help        :: See http://links.sailsjs.org/docs/controllers

module.exports =
  index : (req,res) ->
    res.view 'pages/login', {title : 'Login'}
