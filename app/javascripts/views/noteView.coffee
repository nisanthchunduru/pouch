window.NoteView = Backbone.Marionette.ItemView.extend
  tagName: 'section'
  className: 'noteView'
  template: '#noteViewTemplate'
  events:
    'click a': -> @model.destroy wait: true
