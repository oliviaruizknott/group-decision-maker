import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import OptionList from './containers/OptionList';

$(function() {
  if (document.getElementById('options-new')){
    ReactDOM.render(
      <OptionList />,
      document.getElementById('options-new')
    );
  }
});
