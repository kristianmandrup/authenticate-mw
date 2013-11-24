passport = require 'passport'

facebook_config = require './passport/facebook_config'
local_config    = require './passport/facebook_config'

User           = require '../../models/user'

class BaseConfig
  (app) ->
    @config app

  passport: require 'passport'

  config: (app, name) ->
    @passport.use @strategy
    @configSerialization (args) ->
    @appConfig app
    @strategy!

  strategy: ->
    console.log "Base Passport strategy - please override!"

  appConfig: (app) ->
    app.use express.session(secret: 'keyboard cat')
    app.use passport.initialize!
    app.use passport.session!

  findUserByCredentials: (username, password, done) ->
    User.findOne username: username, password: password, (err, user) ->
      done err user

  findUserById: (id) ->
    User.findById id, (err, user) ->
      done err user

  configSerialization: (done) ->
    @passport.serializeUser (user, done) ->
      done null, user.id
    @passport.deserializeUser (id, done) ->
      done
