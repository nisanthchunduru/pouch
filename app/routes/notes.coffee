Note = require (require 'path').join '..', 'models', 'note.coffee'
db = require (require 'path').join '..', '..', 'db'

module.exports = (app) ->

  app.post '/notes', (req, res) ->
    text = req.body.text
    note = new Note text: text, createdAt: do Date.now

    note.save (err) ->
      return res.send 500 if err
      
      res.json note.attrs

  app.del '/notes/:id', (req, res) ->
    db.remove 'Note', req.params.id, (err) ->
      res.send (if err then 404 else 204)
