import { Component } from 'react'
import Head from 'next/head'
import Link from 'next/link'

class Home extends Component {
  static async getInitialProps({ req }) {
    return { origin: (req ? 'srv' : 'client') }
  }

  render() {
    return <main>
      <Head><title>title now 2 ({this.props.origin})</title></Head>
      <Link href="/other"><a>other</a></Link>
      <p>It works!!1 hot reload? yep shorthand (component now!) lets go</p>
    </main>
  }
}

export default Home
