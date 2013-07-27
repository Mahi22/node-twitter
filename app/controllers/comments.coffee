###
Module dependencies
###
mongoose = require("mongoose")

###
Create comment
###
exports.create = (req, res) ->
  tweet = req.tweet
  user = req.user
  return res.redirect("/tweets/" + tweet.id)  unless req.body.body
  tweet.addComment user, req.body, (err) ->
    return res.render("500")  if err
    res.redirect "/"

