import {shallow} from 'enzyme'
import voidify from '../../test-support/voidify'

import Other from '../../pages/other'

describe 'other page', voidify ->
  it 'renders', ->
    other = shallow(<Other />)
    expect(other.text()).toEqual 'some text (pugged)'
