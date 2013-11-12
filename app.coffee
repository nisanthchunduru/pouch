express = require 'express'
path = require 'path'
dive = require 'dive'

app = do express

viewsPath = path.join __dirname, 'app', 'views'
app.set 'views', viewsPath

assetsPath = path.join __dirname, 'assets'
app.use express.static assetsPath

app.use do express.json

# Load Routes
routesPath = path.join __dirname, 'app', 'routes'
dive routesPath, (err, filePath) ->
  return if err
  module app if (module = require filePath) instanceof Function

db = require path.join __dirname, 'db'
app.listen 9393
