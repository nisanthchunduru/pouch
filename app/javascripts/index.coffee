_.extend Backbone.Model.prototype, Backbone.Validation.mixin
_.extend Backbone.Model.prototype, idAttribute: '_id'

window.app = new Marionette.Application

new NotesFormView
window.notes = new Notes
new NotesView collection: notes
