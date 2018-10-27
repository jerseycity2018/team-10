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
    this.findTime(e);
    this.setState({
      timeIndex: e,
      time: e + ":00"
    });
  }

  onChangeSecondSlider(e) {
    this.findDay(this.state.dayArray[e]);
    this.setState({
      day: this.state.dayArray[e]
    });
  }

  findDay(e) {
    let path = "./data/";
    let specificPath = "";

    switch (e) {
      case "Sunday":
        specificPath = "SUN";
        break;
      case "Monday":
        specificPath = "MON";
        break;
      case "Tuesday":
        specificPath = "TUE";
        break;
      case "Wednesday":
        specificPath = "WED";
        break;
      case "Thursday":
        specificPath = "THU";
        break;
      case "Friday":
        specificPath = "FRI";
        break;
      case "Saturday":
        specificPath = "SAT";
        break;
      default:
    }

    path = path + specificPath + "/";
    path = path + specificPath.toLocaleLowerCase();
    path = path + this.state.timeIndex + ".json";
    //generating the path for our data located
    console.log(path);
    fetch(path)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        let container = [];
        for (let i = 0; i < data.length; i++) {
          container.push({
            center: [data[i].X2 + "  " + data[i].X1],
            radius: 0.05, //we can multiply this to show how populated the area
            points: 100,
            option: {
              fillColor: "yellow",
              strokeColor: "red",
              strokeThickness: 0.1
            }
          });
        }
        this.setState({
          data: container
        });
      })
      .catch(err => {
        console.log(err);
      });
  }

  findTime(e) {
    let path = "./data/";
    let specificPath = "";

    switch (this.state.day) {
      case "Sunday":
        specificPath = "SUN";
        break;
      case "Monday":
        specificPath = "MON";
        break;
      case "Tuesday":
        specificPath = "TUE";
        break;
      case "Wednesday":
        specificPath = "WED";
        break;
      case "Thursday":
        specificPath = "THU";
        break;
      case "Friday":
        specificPath = "FRI";
        break;
      case "Saturday":
        specificPath = "SAT";
        break;
      default:
    }

    path = path + specificPath + "/";
    path = path + specificPath.toLocaleLowerCase();
    path = path + e + ".json";
    //generating the path for our data located

    fetch(path)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        let container = [];
        for (let i = 0; i < data.length; i++) {
          console.log(data[i].X2 + "  " + data[i].X1);
          container.push({
            center: [data[i].X2, data[i].X1],
            radius: 0.05 * data[i].X3 * 0.01, //we can multiply this to show how populated the area
            points: 100,
            option: {
              fillColor: "yellow",
              strokeColor: "red",
              strokeThickness: 0.1
            }
          });
        }
        this.setState({
          data: container
        });
      })
      .catch(err => {
        console.log(err);
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
