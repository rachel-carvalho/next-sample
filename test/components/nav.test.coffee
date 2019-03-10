import {shallow} from 'enzyme'
import voidify from '../support/voidify'

import Nav from '../../components/nav'

describe 'nav', voidify ->
  it 'renders', ->
    nav = shallow(<Nav />)
    expect(nav.find('nav')).toHaveLength 1
    expect(nav.find('nav a')).toHaveLength 5
    expect(nav.find('nav a').at(0).text()).toEqual 'Home'
    expect(nav.find('nav a').at(1).text()).toEqual 'Other'
    expect(nav.find('nav a').at(2).text()).toEqual 'Book: Red Mars'
    expect(nav.find('nav a').at(3).text()).toEqual 'Book: Inexistant'
    expect(nav.find('nav a').at(4).text()).toEqual 'Nope'
