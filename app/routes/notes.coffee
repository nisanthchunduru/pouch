Note = require (require 'path').join '..', 'models', 'note.coffee'
# db = require (require 'path').join '..', '..', 'db'

module.exports = (app) ->

  app.post '/notes', (req, res) ->
    text = req.body.text
    note = new Note(text: text, createdAt: Date.now())

    note.save (err, saved_note) ->
      return res.send 500 if err
      
      res.json saved_note.attrs

  app.del '/notes/:id', (req, res) ->
    note = new Note(_id: req.params.id)
    note.remove (err) ->
      res.send (if err then 404 else 204)  
    
