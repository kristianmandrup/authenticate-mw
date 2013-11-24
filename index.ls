module.exports =
  mw:         require './mw/authenticate-mw'
  runner:     require './runner/authenticator'
  config:
    facebook: require './mw/passport/facebook_config'
    google:   require './mw/passport/google_config'
    twitter:  require './mw/passport/twitter_config'
    local:    require './mw/passport/local_config'