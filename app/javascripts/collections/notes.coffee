window.Notes = Backbone.Paginator.requestPager.extend
  model: Note
  paginator_core:
    dataType: 'json'
    url: '/notes'
  paginator_ui:
    firstPage: 1
    currentPage: 1
    perPage: 10
  server_api: -> hints: $orderby: createdAt: 1
  parse: (response) -> response
  initialize: ->
    app.commands.setHandler 'createNote', (attributes) ->
      notes.create attributes, validate: true, wait: true

    app.commands.setHandler 'removeNote', (model) ->
      notes.remove model
