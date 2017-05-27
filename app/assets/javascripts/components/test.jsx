/* global React */
import React from 'react';
import { findDOMNode } from 'react-dom';
import $ from 'jquery';

var SubscribeMessage = React.createClass({
  render: function() {
    return (
      <h1 id="subscribe_text">Subscribe {this.props.name}!</h1>
    )
  }
});