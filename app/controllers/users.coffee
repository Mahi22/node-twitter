###
Module dependencies
###
Mongoose = require("mongoose")
User = Mongoose.model("User")
exports.signin = (req, res) ->


###
Auth callback
###
exports.authCallback = (req, res, next) ->
  res.redirect "/"


###
Show Login form
###
exports.login = (req, res) ->
  res.render "users/login",
    title: "Login"
    message: req.flash("error")



###
Show signup form
###
exports.signup = (req, res) ->
  res.render "users/signup",
    title: "Sign up"
    user: new User()



###
Logout
###
exports.logout = (req, res) ->
  req.logout()
  res.redirect "/login"


###
Session
###
exports.session = (req, res) ->
  res.redirect "/"


###
Create user
###
exports.create = (req, res) ->
  user = new User(req.body)
  user.provider = "local"
  user.save (err) ->
    if err
      return res.render("users/signup",
        errors: err.errors
        user: user
      )
    req.logIn user, (err) ->
      return next(err)  if err
      res.redirect "/"



exports.show = (req, res) ->
  user = req.profile
  res.render "users/show",
    title: user.name
    user: user



###
Find user by id
###
exports.user = (req, res, next, id) ->
  User.findOne(_id: id).exec (err, user) ->
    return next(err)  if err
    return next(new Error("failed to load user " + id))  unless user
    req.profile = user
    next()

