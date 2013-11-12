window.Note = Backbone.Model.extend
  validation:
    text:
      required: true
      minLength: 1
