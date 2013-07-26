###
Favorites
###

###
Create a favorite
###
exports.create = (req, res) ->
  tweet = req.tweet
  console.log req.user
  tweet._favorites = req.user
  tweet.save (err) ->
    return res.send(400)  if err
    res.send 201, {}



###
Delete a like
###
exports.destroy = (req, res) ->
  tweet = req.tweet
  tweet._favorites = req.user
  tweet.save (err) ->
    return res.send(400)  if err
    res.send 200

