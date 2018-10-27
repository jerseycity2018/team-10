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
  componentWillReceiveProps() {}
  render() {
    return (
      <div className="graph">
        <div id="test" />
        <ReactBingmaps
          bingmapKey={this.state.key}
          center={[40.7829, -73.9654]}
          mapTypeId={"aerial"}
          zoom={14.45}
          regularPolygons={[
            {
              center: [40.7829, -73.9654],
              radius: 0.03,
              points: 100,
              option: {
                fillColor: "red",
                strokeThickness: 0
              },
              disableScrollWheelZoom: true
            }
          ]}
        />
      </div>
    );
  }
}
