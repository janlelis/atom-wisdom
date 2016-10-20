provider = require './provider'

module.exports =
  activate: ->
    # atom.workspaceView.statusBar?.appendLeft('<span>BLA</span>')
    [] #nothing provider.loadProperties()
  getProvider: -> provider

