import React from "react";
import { NavLink, Switch, Route } from "react-router-dom";

export class LandingPage extends React.Component {
  render() {
    return (
      <nav
        className={"navbar navbar-expand-lg fixed-top navbar-light bg-light"}
      >
        <div className="container">
          <NavLink
            className="navbar-brand eyeat"
            to="/"
            spy={true}
            smooth={true}
            duration={500}
          >
            Central Park Dashboard
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
                  Place
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
              <li className="nav-item">
                <NavLink
                  className="nav-link"
                  to="download"
                  spy={true}
                  smooth={true}
                  duration={500}
                >
                  Social Media
                </NavLink>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}
