passport        = require 'passport'
LocalConfig     = require '../../../mw/passport/local_config'

authenticate-mw = new AuthenticateMw app LocalConfig
authenticate-mw.authenticate!
