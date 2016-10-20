client = require './client'

module.exports =
  selector: '*'
  disableForSelector: '.source.js .comment'
  inclusionPriority: 1
  excludeLowerPriority: true

  getSuggestions: ({ editor, bufferPosition }) ->
    payload = JSON.stringify({
      buffer: editor.buffer.getText(),
      position: { column: bufferPosition.column, row: bufferPosition.row }
    })
    client.getSuggestions({ payload })

  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->
    atom.commands.dispatch(atom.views.getView(editor), 'autocomplete-plus:activate')
