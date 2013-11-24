GoogleStrategy = require('passport-google-oauth').OAuthStrategy

class GoogleConfig extends PassportConfig
  (app) ->
    super ...

  strategy: (app) ->
    new GoogleStrategy {
      clientId:     app.config.clientId
      clientSecret: app.config.clientSecret
      callbackURL:  @callbackURL
    },
    (accessToken, refreshToken, profile, done) ->
      @findOrCreate profile

  callbackURL: "http://127.0.0.1:3000/auth/google/callback"

  findOrCreate: (profile) ->
      User.findOrCreate googleId: profile.id, (err, user) ->
        done err, user
