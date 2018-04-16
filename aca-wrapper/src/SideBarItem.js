import React from 'react';
import PropTypes from 'prop-types';

class SideBarItem extends React.Component {
  constructor() {
    super()
    this.state = {
      open: false,
    }
  }

  toggleOpen() {
    this.setState({
      open: !this.state.open,
    })
  }

  render() {
    return (
      <div
        className={`guideItem ${this.state.open ? 'showing' : 'hiding'}`}
      >
        <div
          className='guideItemTitle'
          onClick={() => {
            this.toggleOpen()
          }}
        >
          <span>
            {this.props.title}
            <i className='fa fa-chevron-down'></i>
          </span>
        </div>
        <div
          className='guideItemContent'
          style={{
            padding: '0.5em',
            display: this.state.open ? 'unset' : 'none'
          }}
        >
          {this.props.content}
        </div>
      </div>
    )
  }
}

SideBarItem.propTypes = {
  title: PropTypes.string,
  content: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.element,
  ]),
}

SideBarItem.defaultProps = {
  title: 'Title Goes Here',
  content: 'Content goes here.',
}

export default SideBarItem;
