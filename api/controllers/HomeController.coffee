 # HomeController
 #
 # @description :: Server-side logic for managing homes
 # @help        :: See http://links.sailsjs.org/docs/controllers

module.exports =
  index : (req,res)->

    res.view 'home/homepage', {title: 'Englisheverytime'}
