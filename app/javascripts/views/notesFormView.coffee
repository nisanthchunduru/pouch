window.NotesFormView = Backbone.Marionette.ItemView.extend
  el: $ '#notesFormView'
  template: '#notesFormTemplate'
  events:
    'submit form': @el
  keys:
    'enter': (event) -> @createNoteOnEnter event unless event.shiftKey
  
  initialize: ->
    do @render

    @textarea = @$el.find '.text'
    do @textarea.autosize
    do @observeTextareaHeight

  observeTextareaHeight: ->
    onSummary = (summaries) ->
      return unless (valueChanged = summaries[0].valueChanged).length
      return unless (style = valueChanged[0].style)

      (@$el.children 'input').css 'height', style.getPropertyValue 'height'

    @textarea.mutationSummary 'connect', onSummary, true, [attribute: 'style']

  createNoteOnEnter: (event) ->
    do event.preventDefault

    text = do @textarea.val
    (@textarea.val '').trigger 'autosize.resize'

    app.execute 'createNote', text: text
