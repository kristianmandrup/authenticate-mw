require! '../../test_setup'

_ = require 'lodash'

middleware      = require 'middleware'

Authenticator   = require '../../../runner/authenticator'
AuthenticateMw  = require '../../../mw/authenticate_mw'

PassportConfig  = require '../../../mw/passport/base_config'

describe 'Authenticator' ->
  var mw, runner, user

  # function to be assigned runner, to be called when runner is done
  doneFun = ->
    'done :)'

  before ->
    user    := new User 'kris'
    mw      := new AuthenticateMw app, PassportConfig
    runner  := new Authenticator(user: user).use mw

  specify 'should be a AuthenticateMw' ->
    runner.constructor.should.be.eql Authenticator

  specify 'first middleware should be a AuthenticateMw' ->
    _.first(runner.middlewares).should.be.eql mw
