# Authentication middleware

Authentication middleware for Node.js (by default) using Passport.js

## Install

`authenticate-mw = require 'authenticate-mw'`

Exports the following structure:

```
mw:
runner:
config:
  facebook:
  google:
  twitter:
  local:
```

## Usage

See `test` folder ;)

```
LocalConfig = authenticate-mw.config.local
authenticator = new authenticate-mw.runner app, LocalConfig
authenticator.authenticate user
```

## TODO

Allow multiple strategy configurations, so user can choose which strategy to authenticate with ;)