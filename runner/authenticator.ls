passport      = require 'passport'

middleware    = require 'middleware'
BaseRunner    = middleware.runner.base

class Authenticator extends BaseRunner
  (args) ->

  run:
    mw.authenticate