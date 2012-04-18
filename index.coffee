http    = require 'http'
express = require 'express'
stylus  = require 'stylus'
fs      = require 'fs'
util    = require 'util'

module.exports = app = express.createServer()

app.register '.html', require 'ejs'
app.set 'view engine', 'html'

app.use express.compiler src: './client_scripts', dest: './public', enable: ['coffeescript'] # Need to be earlier than 'static'
app.use stylus.middleware src: './client_css', dest: './public' # Compile CSS files
app.use express.static './public'

app.get '/', (req, res, next) ->
    res.render 'index'


app.listen 7777
