querystring = require 'querystring'
fetch       = require 'isomorphic-fetch'

module.exports =
  getSuggestions: (args) ->
    # console.log('args', args)
    url = "http://localhost:9292?" + querystring.stringify(args)

    fetch(url).then((response) ->
      throw new Error("Bad response from server") if response.status >= 400
      return response.json()
    ).catch((error) ->
      console.log('Error fetching', error)
      return []
    ).then((data) ->
      console.log('got good response', data.suggestions)
      return data.suggestions
    )