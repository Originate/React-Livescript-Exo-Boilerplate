require! {
  './logo.png': logo-src
  './stylesheet'
  # 'create-factory!react-bootstrap/lib/Navbar'
  'react': {PropTypes}
}
e = require('react-e/bind')(stylesheet)


Nav = (props) ->
  e '.root', props.name


Nav.propTypes =
  name: PropTypes.string


module.exports = Nav
