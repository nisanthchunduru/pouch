window.NotesView = Backbone.Marionette.CollectionView.extend
  el: $ '#notesView'
  itemView: NoteView

  initialize: -> @collection.goTo 1
