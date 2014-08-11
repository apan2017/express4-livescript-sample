global <<< require \prelude-ls

require! \express
require! \path
require! \cookie-parser
require! \body-parser

favicon = require \static-favicon
logger  = require \morgan

routes  = require './routes/index'
users   = require './routes/users'

app     = express!

app .set \views, path.join __dirname, \views
app .set 'view engine'  \jade

each (!-> app .use it) <| do
  [
    favicon!
    logger \dev
    body-parser.json!
    body-parser.urlencoded!
    cookie-parser!
    express .static path.join __dirname, \public
  ]

app .use \/ routes
app .use \/users users

app .use !->
  err = new Error 'Not Found'
  err.status = 404
  next err

if app .get \env == \development
  app .use (err, req, res, next) !->
    res .status err.status || 500
    res .render \error do
      message: err.message
      error: err


app .use (err, req, res, next) !->
  res .status err.status || 500
  res .render \error do
    message: err.message
    error: {}


module.exports = app
