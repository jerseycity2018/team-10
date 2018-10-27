import React from "react";
import { ReactBingmaps } from "react-bingmaps";
import "../Graph.css";

export class Graph extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      key: ""
    };
  }

  render() {
    return (
      <div className="graph">
        <div id="test" />
        <ReactBingmaps
          bingmapKey={this.state.key}
          center={[40.7829, -73.9654]}
          mapTypeId={"aerial"}
          zoom={14.45}
          maxBounds={[40.7829, -73.9654]}
          regularPolygons={[
            {
              center: [40.7829, -73.9654],
              radius: 0.02, //we can multiply this to show how populated the area
              points: 100,
              option: {
                fillColor: "yellow",
                strokeColor: "red",
                strokeThickness: 0.1
              }
            },
            {
              center: [40.78, -73.9654],
              radius: 0.02, //we can multiply this to show how populated the area
              points: 100,
              option: {
                fillColor: "yellow",
                strokeColor: "red",
                strokeThickness: 0.1
              }
            }
          ]}
        />
      </div>
    );
  }
}
