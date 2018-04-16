import React from 'react';
import PropTypes from 'prop-types';
import SideBarItem from './SideBarItem.js'


// Make a dropdown of what folks can do
// When something is selected, the appropriate google doc shows
// Model after https://www.designcouncil.org.uk/


const guides = [
  {
    title: 'A-frame sign permit',
    content: (<iframe src="https://docs.google.com/document/d/e/2PACX-1vSgEiL2OqfduRGeegnaWPFYHKyCTTaOBDVPKcsWl5L87mK82n7lx0P9qwIwHx22G3Dzr3b-PWd15y7_/pub?embedded=true"></iframe>)
  },
  {
    title: 'Schedule inspection',
    content: 'Log in and then search for the thing'
  },
  {
    title: 'Look up a permit',
    content: 'Do some stuff'
  },
  {
    title: 'Look up permits by type',
    content: 'Do some stuff'
  },
  {
    title: 'Make a payment',
    content: 'Send us an envelope of cash'
  },
  {
    title: 'Check permit application status',
    content: 'Wheee it\'s content'
  },
]


class SideBar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      open: props.startOpen,
    }
  }

  toggleOpen() {
    this.setState({
      open: !this.state.open,
    })
  }

  render() {
    return (<div
      id='avl-aca-sidebar'
      className={this.state.open ? 'showing' : 'hiding'}
    >
      <button
        id='sidebar-button'
        onClick={() => {
          this.props.parentOnClick(!this.state.open)
          this.toggleOpen()
        }}
      >
      <i className="fa fa-chevron-right fa-2x"></i>
      </button>
      <div
        id='sidebar-show-hide'
      >
        <h2>Accela Citizen Access Guides</h2>
        {guides.map(guide => (
          <SideBarItem
            title={guide.title}
            content={guide.content}
            key={guide.title}
          />
        ))}
      </div>
    </div>)
  }
}

SideBar.propTypes = {
  parentOnClick: PropTypes.func,
}

SideBar.defaultProps = {
  parentOnClick: () => {},
}

export default SideBar;
