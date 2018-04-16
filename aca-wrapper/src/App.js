import React from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import './App.css';
import SideBar from './SideBar.js'


// react router example: https://reacttraining.com/react-router/web/example/basic

class App extends React.Component {
  constructor() {
    super()
    this.state = {
      offset: true,
    }
  }

  render() {
    return (<Router>
      <div>
        <div className='header'>
          <div id='city-icon'>
            <a title="City of Asheville main page" href="https://www.ashevillenc.gov" target="_blank" rel="noopener">
              <img src="https://www.ashevillenc.gov/img/00/layout/citylogo.png"></img>
            </a>
          </div>
          <nav>
            <ul>
              <li>
                <a href="https://www.ashevillenc.gov/departments/development/default.htm" target="_blank" rel="noopener">
                  Development Services Main
                </a>
              </li>
              <li>FAQ</li>
            </ul>
          </nav>
        </div>
        <div className='content'>
          <SideBar
            parentOnClick={(sidebarOpen) => {this.setState({offset: sidebarOpen})}}
            startOpen={this.state.offset}
          />
          <div
            className={`avl-aca-main ${this.state.offset ? 'offset' : 'centered'}`}
          >
            <Route exact path='/' component={Login}/>
            <Route path='/login' component={Login}/>
            <Route path='/search' component={Search}/>
          </div>
        </div>
      </div>
    </Router>)
  }
}


// const BigButton = (props) => (
//     <Link to={props.url}>
//       <button type='button' className='BigButton'>
//         {props.text}
//       </button>
//     </Link>
// )

// const Home = ({match}) => (
//     <div id='bigButtons'>
//       <BigButton
//         className='BigButton search'
//         text='Search All Records'
//         key='search'
//         url={`/search`}
//       />
//       <BigButton
//         className='BigButton login'
//         text='Log In'
//         key='login'
//         url={`/login`}
//       />
//     </div>
// )

const Login = () => (
  <iframe id="avl-aca-frame" src="https://services.ashevillenc.gov/ACADEV/Welcome.aspx"></iframe>
)

const Search = () => (
  <iframe id="avl-aca-frame" src="https://services.ashevillenc.gov/ACADEV/Cap/CapHome.aspx?module=Permits&TabName=Permits&TabList=Home%7C0%7CPermits%7C1%7CPlanning%7C2%7CServices%7C3%7CCurrentTabIndex%7C1"></iframe>
)


export default App;
