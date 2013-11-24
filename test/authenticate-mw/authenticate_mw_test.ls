require! '../../test_setup'

middleware      = require 'middleware'

Authenticator   = require '../../../mw/authenticator'
AuthenticateMw  = require '../../../mw/authenticate_mw'

describe 'AuthenticateMw' ->
  var mw, runner, user

  # function to be assigned runner, to be called when runner is done
  doneFun = ->
    'done :)'

  before ->
    user    := new User 'kris'
    runner  := new Authenticator user: user
    mw      := new AuthenticateMw passport: 'local'

  specify 'should be a AuthenticateMw' ->
    mw.constructor.should.be.eql AuthenticateMw
