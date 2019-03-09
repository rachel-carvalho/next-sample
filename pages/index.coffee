import { Component } from 'react'

import template from '../templates/index.pug'

class Home extends Component
  @getInitialProps: ({ req }) ->
    await { origin: (if req then 'srv' else 'client') }

  render: ->
    template.call(this, @props)

export default Home
