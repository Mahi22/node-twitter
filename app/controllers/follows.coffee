###
follow
###
mongoose = require("mongoose")
User = mongoose.model("User")
async = require("async")
exports.follow = (req, res, next) ->
  user = req.user
  id = req.url.split("/")[2]
  user.follow id
  user.save (err) ->
    res.send 400  if err
    res.send 201, {}

