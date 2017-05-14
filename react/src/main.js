import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import OptionList from './containers/OptionList';
import OptionShow from './containers/OptionShow';

$(function() {
  if (document.getElementById('options-new')){
    ReactDOM.render(
      <OptionList />,
      document.getElementById('options-new')
    );
  }
});
$(function() {
  if (document.getElementById('option-show')){
    ReactDOM.render(
      <OptionShow />,
      document.getElementById('option-show')
    );
  }
});
