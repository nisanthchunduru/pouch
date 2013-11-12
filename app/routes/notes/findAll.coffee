schemajs = require 'schemajs'
_ = require 'underscore'
Note = require (require 'path').join '..', '..', 'models', 'note.coffee'

module.exports = (app) ->

  middleware = [
    do ->
      schema = schemajs.create
        query:
          type: 'object'
          schema:
            hints:
              type: 'object'
              default: {}
              required: true
              schema:
                $orderby:
                  type: 'object'
                  schema:
                    createdAt:
                      type: 'int'
                      filters: 'toInt'
                      properties: in: [-1, 1]
                $max:
                  type: 'int'
                  filters: ['toInt']
                $skip:
                  type: 'int'
                  filters: ['toInt']

      return (req, res, next) ->
        result = schema.validate query: req.query
        return res.send 400 unless result.valid

        req.query = result.data.query
        do next
  ]

  app.get '/notes', middleware, (req, res) ->
    Note.all {}, req.query.hints, (err, all) ->
      return res.send 500 if err

      res.json all.map (note) -> note.attrs
