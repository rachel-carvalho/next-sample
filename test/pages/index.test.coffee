import {shallow} from 'enzyme'
import voidify from '../support/voidify'

import Index from '../../pages/index'

describe 'index page', voidify ->
  it 'renders', ->
    index = shallow(<Index />)
    expect(index.find('p').text()).toEqual 'It works!!1 hot reload! coffeeeeeeee! puuuug!'
    expect(index.find('Head title').text()).toEqual 'title now 2 ()'
