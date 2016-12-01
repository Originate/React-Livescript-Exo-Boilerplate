require! {
  './api'
  # Optional bootstrap styling
  # 'bootstrap/dist/css/bootstrap'
  './stylesheet'
  'create-factory!./components/nav': Nav
  'react': {Component, create-element}
  'react-dom'
  'react-e': e
}
React = require 'react'

class Main extends Component

  ->
    @state =
      # Initial state
      name: 'Test Page'

  render: ->
    e '.container',
      # Create the imported component Nav
      Nav name: @state.name

# This should be the only spot that renders the outer DOM React component
react-dom.render create-element(Main), document.get-element-by-id 'app'
