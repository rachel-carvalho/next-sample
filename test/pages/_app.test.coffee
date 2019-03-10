import NextApp from 'next/app'

import {shallow} from 'enzyme'
import voidify from '../support/voidify'

import App from '../../pages/_app'

describe 'App', voidify ->
  it 'is a next app', ->
    expect(App.prototype).toBeInstanceOf NextApp

  it 'renders', ->
    Component = ({first, sec})-> <marquee>{first} component! {sec}</marquee>
    app = shallow(<App pageProps={first: 1, sec: 2} Component={Component} router={{}} />)
    expect(app.find('Container Head title').text()).toEqual 'App title2'
    expect(app.find('Container WithParams')).toHaveLength 1
    expect(app.html()).toContain 'nav'
    expect(app.html()).toContain 'marquee>1 component! 2'
