# create-factory-loader [![CircleCI](https://circleci.com/gh/Originate/create-factory-loader.svg?style=svg)](https://circleci.com/gh/Originate/create-factory-loader)

Webpack loader to wrap exported react components in `react.createFactory`.

## Installing
`npm install --save create-factory-loader`

## Example Usage

`components/tab.coffee`:
```coffeescript
class Tab extends react.Component

  render: ->
    div null, @props.text
```

`components/tab_view.coffee`:
```coffeescript
Tab = require 'create-factory!./tab'

class TabView extends react.Component

  render: ->
    for tab in @props.tabs
      Tab text: tab.name
```
