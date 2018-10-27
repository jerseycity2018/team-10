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
import { Graph } from "./component/Graph";

import Slider from "rc-slider";
// We can just import Slider or Range to reduce bundle size
// import Slider from 'rc-slider/lib/Slider';
// import Range from 'rc-slider/lib/Range';
import "rc-slider/assets/index.css";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      sliderA: 0,
      sliderB: 0,
      time: 0,
      dayArray: [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
      ],
      day: "Sunday"
    };

    this.onChangeFirstSlider = this.onChangeFirstSlider.bind(this);
    this.onChangeSecondSlider = this.onChangeSecondSlider.bind(this);
  }

  onChangeFirstSlider(e) {
    // console.log("the time " + e); //console.log the value from the scroll
    this.setState({
      time: e + ":00"
    });
  }

  onChangeSecondSlider(e) {
    // console.log("the date " + e);
    this.setState({
      day: this.state.dayArray[e]
    });
  }

  render() {
    return (
      <div className="container-fluid cover">
        <div className="row">
          <div className="col">
            <LandingPage />
            <div className="container">
              <div className="row">
                <div className="col">
                  <Graph />
                  <div className="row scrollbar">
                    <div className="col">
                      <Slider
                        onChange={this.onChangeSecondSlider}
                        min={0}
                        max={6}
                        defaultValue={0}
                      />
                      <p>Day: {this.state.day}</p>
                    </div>
                    <div className="col">
                      <Slider
                        onChange={this.onChangeFirstSlider}
                        min={0}
                        max={23}
                        defaultValue={0}
                      />
                      <p>Time: {this.state.time}</p>
                    </div>
                  </div>
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
