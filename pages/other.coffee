import { Fragment } from 'react'
import Link from 'next/link'

import template from '../templates/other.pug'

export default ->
  template.call(this, {Fragment, Link})
