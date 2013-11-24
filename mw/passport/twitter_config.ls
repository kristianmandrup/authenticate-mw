passport-local = require 'passport-local'
LocalStrategy  = require('passport-local').Strategy
User           = require '../../models/user'

class LocalConfig extends BaseConfig
  (app) ->
    super ...

  strategy: ->
    new TwitterStrategy

  strategy: (app) ->
    new TwitterStrategy {
      consumerKey:      app.config.consumerKey
      consumerSecret:   app.config.consumerSecret
      callbackURL:      @callbackURL
    },
    (token, tokenSecret, profile, done) ->
      @findOrCreate profile

  callbackURL: "http://127.0.0.1:3000/auth/twitter/callback"

  findOrCreate: (profile) ->
    User.findOrCreate twitterId: profile.id, (err, user) ->
      done err, user
