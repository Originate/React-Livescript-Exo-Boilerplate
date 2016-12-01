require! {
  './api'
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
      name: 'Test Page'

  render: ->
    e '.container',
      Nav name: @state.name

react-dom.render create-element(Main), document.get-element-by-id 'app'
