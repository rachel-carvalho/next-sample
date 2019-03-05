import { Component, Fragment } from 'react'
import Head from 'next/head'
import Link from 'next/link'

class Home extends Component
  @getInitialProps: ({ req }) ->
    await { origin: (if req then 'srv' else 'client') }

  render: ->
    <Fragment>
      <Head><title>title now 2 ({this.props.origin})</title></Head>
      <Link prefetch href="/other"><a>other</a></Link>
      <p>It works!!1 hot coffeeeeeeee! reload? yep shorthand (component now!) lets go</p>
    </Fragment>

export default Home
