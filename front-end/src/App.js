// start of bootstrap stuff
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
// import $ from "jquery";
// import Popper from "popper.js";
// end of bootstrap stuff

// import { Route, Link } from "react-router-dom";

import React, { Component } from "react";
import "./App.css";

import { LandingPage } from "./component/LandingPage";
// import { Footer } from "./Footer";
import { Graph } from "./component/Graph";

// We can just import Slider or Range to reduce bundle size
// import Slider from 'rc-slider/lib/Slider';
// import Range from 'rc-slider/lib/Range';
import Slider from "rc-slider";
import "rc-slider/assets/index.css";

import * as d3 from "d3";
import { SSL_OP_MICROSOFT_BIG_SSLV3_BUFFER } from "constants";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      sliderA: 0,
      sliderB: 0,
      time: 0,
      timeIndex: 0,
      dayArray: [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
      ],
      day: "Sunday",
      data: []
    };

    this.onChangeFirstSlider = this.onChangeFirstSlider.bind(this);
    this.onChangeSecondSlider = this.onChangeSecondSlider.bind(this);
    this.findDay = this.findDay.bind(this);
    this.findTime = this.findTime.bind(this);
  }

  onChangeFirstSlider(e) {
    this.setState(
      {
        time: e + ":00"
      },
      this.findTime(e)
    );
  }

  onChangeSecondSlider(e) {
    // console.log("the date " + e);
    this.findDay(this.state.day);
    this.setState(
      {
        day: this.state.dayArray[e]
      }
      // this.findDay(this.state.day)
    );
  }

  findDay(e) {
    let columns = new Array(24);
    let path = "./data/";
    let specificPath = "";

    // switch (e) {
    //   case "Sunday":
    //     specificPath = "SUN";
    //     // console.log("enter");
    //     break;
    //   case "Monday":
    //     specificPath = "MON";
    //     console.log("enter");
    //     break;
    //   case "Tuesday":
    //     specificPath = "TUE";
    //     break;
    //   case "Wednesday":
    //     specificPath = "WED";
    //     break;
    //   case "Thursday":
    //     specificPath = "THU";
    //     break;
    //   case "Friday":
    //     specificPath = "FRI";
    //     break;
    //   case "Saturday":
    //     specificPath = "SAT";
    //     break;
    //   default:
    // }
    // path = path + specificPath;
    // path =
    //   path +
    //   "/" +
    //   specificPath.toLocaleLowerCase() +
    //   this.state.timeIndex +
    //   ".csv";
    // console.log(path);
    path = "./data/MON/mon0.json";
    fetch(path)
      .then(response => response.json())
      .then(data => {
        let abc = [];
        for (let i = 0; i < data.length; i++) {
          abc.push({
            center: [data[i].lat, data[i].long],
            radius: 0.015, //we can multiply this to show how populated the area
            points: 100,
            option: {
              fillColor: "yellow",
              strokeColor: "red",
              strokeThickness: 0.1
            }
          });
        }
        this.setState({
          data: abc
        });
      })
      .catch(err => {
        console.log(err);
      });

    // console.log(this.state.data);
  }

  findTime(e) {
    // console.log(e);
  }

  render() {
    // console.log(this.state.data);
    return (
      <div className="container-fluid cover">
        <div className="row">
          <div className="col">
            <LandingPage />
            <div className="container">
              <div className="row">
                <div className="col">
                  <Graph data={this.state.data} />
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
