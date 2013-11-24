passport = require 'passport'

middleware = require 'middleware'

BaseMw = middleware.mw.base

class AuthenticateMw extends BaseMw
  (app, configure-clazz) ->
    @config app configure-clazz

  authenticate: (strategy) ->
    passport.authenticate strategy,
      successRedirect:    '/'
      failureRedirect:    '/login'

  # TODO:
  # should allow multiple configurations,
  # so that we allow user choosing between strategy/auth-provider to use
  config: (configure-clazz)->
    @config = new configure-clazz app