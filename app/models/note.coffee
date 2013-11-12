modella = require 'modella'
validators = require 'modella-validators'
ejdb = require 'modella-ejdb'
db = require (require 'path').join '..', '..', 'db'

Note = modella 'Note'
Note.use validators
Note.use ejdb db

((Note
  .attr '_id')
  # TODO: Add text length validator
  .attr 'text', required: true, type: 'string')
  .attr 'createdAt', required: true

module.exports = Note
