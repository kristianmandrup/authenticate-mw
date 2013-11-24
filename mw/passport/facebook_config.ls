PassportConfig    = require './base_config'
FacebookStrategy  = require('passport-facebook').Strategy

class FacebookConfig extends PassportConfig
  strategy: (app) ->
    new FacebookStrategy {
      clientID:       app.config.FACEBOOK_APP_ID
      clientSecret:   app.config.FACEBOOK_APP_SECRET

      profileFields:  @profileFields

      callbackURL:    @callbackURL
    },
      (accessToken, refreshToken, profile, done) ->
        @findOrCreate profile

  callbackURL: "http://localhost:3000/auth/facebook/callback"

  profileFields: ['id', 'displayName', 'photos']

  findOrCreate: (profile) ->
    User.findOrCreate facebookId: profile.id, (err, user) ->
      done err user
