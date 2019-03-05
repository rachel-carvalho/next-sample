import { Component, Fragment } from 'react'
import Head from 'next/head'
import Link from 'next/link'

import template from '../templates/index.pug'

class Home extends Component
  @getInitialProps: ({ req }) ->
    await { origin: (if req then 'srv' else 'client') }

  render: ->
    template.call(this, {@props, Fragment, Head, Link})

export default Home
