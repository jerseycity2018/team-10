import React from "react";
import { ReactBingmaps } from "react-bingmaps";
import "../Graph.css";

const key = "AoT3mpFuBYAL0kcQfWBFPlLH23U-6Y-uR_BSBuN9oJOaKPYsa-qolk0fRG-s5hsU";

export class Graph extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillUpdate(props) {
    this.props = props;
  }

  render() {
    // console.log("checking props.data", this.props.data);
    return (
      <div className="graph">
        <div id="test" />
        <ReactBingmaps
          bingmapKey={key}
          center={[40.7829, -73.9654]}
          mapTypeId={"aerial"}
          zoom={14.45}
          maxBounds={[40.7829, -73.9654]}
          regularPolygons={this.props.data}
        />
      </div>
    );
  }
}
