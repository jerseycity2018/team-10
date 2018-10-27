// start of bootstrap stuff
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import $ from "jquery";
import Popper from "popper.js";
// end of bootstrap stuff

import { Route, Link } from "react-router-dom";

import React, { Component } from "react";
import "./App.css";

import { LandingPage } from "./component/LandingPage";
import { Footer } from "./Footer";

class App extends Component {
  render() {
    return (
      <div className="container-fluid landing">
        <div className="row">
          <div className="col">
            <div className="container">
              <div className="row">
                <div className="col">
                  <LandingPage />
                  <div className="graph" />
                  <Footer />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
