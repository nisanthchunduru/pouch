modella = require 'modella'
validators = require 'modella-validators'
nedb = require 'modella-nedb'
path = require 'path'

Note = modella('Note')
Note.use(validators)
db_path = path.join('..', '..', 'db', 'pouch.db')
Note.use(nedb(db_path))

Note.attr('_id')
    .attr('text', required: true, type: 'string')
    .attr('createdAt', required: true)

module.exports = Note
