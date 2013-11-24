passport-local = require 'passport-local'
LocalStrategy  = require('passport-local').Strategy
User           = require '../../models/user'

class LocalConfig extends BaseConfig
  (app) ->
    super ...

  strategy: ->
    new LocalStrategy (username, password, done) ->
      @findUserByCredentials username, password, done

  findUserByCredentials: (username, password, done) ->
    User.findOne username: username, password: password, (err, user) ->
      done err user
