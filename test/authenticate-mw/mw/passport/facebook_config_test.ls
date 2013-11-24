# See https://github.com/jaredhanson/passport-facebook/blob/master/examples/login/app.js

express           = require 'express'
passport          = require 'passport'
FacebookConfig    = require '../../../mw/passport/facebook_config'

app = express!
app.config =
  fb_app_id:      "--insert-facebook-app-id-here--"
  fb_app_secret:  "--insert-facebook-app-secret-here--"

authenticate-mw = new AuthenticateMw app FacebookConfig
authenticate-mw.authenticate!