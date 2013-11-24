# See https://github.com/jaredhanson/passport-google-oauth

express           = require 'express'
passport          = require 'passport'
GoogleConfig      = require '../../../mw/passport/google_config'

app = express!
app.config =
  clientID:       "GOOGLE_CLIENT_ID"
  clientSecret:   "GOOGLE_CLIENT_SECRET"

authenticate-mw = new AuthenticateMw app GoogleConfig
authenticate-mw.authenticate!
