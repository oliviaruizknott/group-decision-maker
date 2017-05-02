import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  ReactDOM.render(
    <p>(React components can go in this div.)</p>,
    document.getElementById('app')
  );
});
