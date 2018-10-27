import React from "react";
import { NavLink, Switch, Route } from "react-router-dom";
import "../Landing.css";

export class LandingPage extends React.Component {
  render() {
    return (
      <nav className={"navbar navbar-expand-lg navbar-light bg-light header"}>
        <div className="container">
          <NavLink
            className="navbar-brand eyeat"
            to="/"
            spy={true}
            smooth={true}
            duration={500}
          >
            <img
              src="https://www.nyrr.org/sites/default/files/styles/image202x151/public/Central-Park-Con_0.png?itok=g0BiVBfk"
              height="60px"
              alt="logo"
            />
          </NavLink>
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>

          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav ml-auto">
              <li className="nav-item">
                <NavLink
                  className="nav-link"
                  to="/"
                  spy={true}
                  smooth={true}
                  duration={500}
                >
                  Central Park Dashboard
                </NavLink>
              </li>
              <li className="nav-item">
                <NavLink
                  className="nav-link"
                  to="main" //need to change
                  spy={true}
                  smooth={true}
                  duration={500}
                >
                  Time
                </NavLink>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}
