import React, { Component } from 'react';
import ResponseBox from '../components/ResponseBox'

class OptionShow extends Component {
  constructor(props){
    super(props);
    this.state = {
      optionText: null,
      optionNotes: null,
      selectedResponseId: null,
      selectedResponseScore: null
    };
    this.handleSelectedResponse = this.handleSelectedResponse.bind(this);
  }

  componentDidMount(){
    let optionShow = document.getElementById('option-show');
    let optionId = optionShow.dataset.id;
    fetch(`/api/v1/options/${optionId}`)
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(option => {
      this.setState({
        optionText: option.text,
        optionNotes: option.notes
      });
    });
  }

  handleSelectedResponse(responseId, responseScore) {
    if (this.state.selectedResponseId === responseId) {
      this.setState({ selectedResponseId: null });
      this.setState({ selectedResponseScore: null })
    } else {
      this.setState({ selectedResponseId: responseId });
      this.setState({ selectedResponseScore: responseScore })
    }
  }

  render(){
    let className
    let responseObject = {"please-no": ["Please no!", -3], "rather-not": ["I’d rather not.", -1], "sure": ["Sure!", 1], "please-yes": ["Please yes!!!", 2]}
    let responseArray = Object.keys(responseObject)

    let responses = responseArray.map((responseKey) => {
      if (responseKey === this.state.selectedResponseId) {
        className = 'selected';
      } else {
        className = '';
      }

      let handleClick = () => {
        this.handleSelectedResponse(responseKey, responseObject[responseKey][1]);
      };

      return(
        <ResponseBox
          key={responseKey}
          id={responseKey}
          text={responseObject[responseKey][0]}
          handleClick={handleClick}
          className={className}
        />
      )
    })

    return(
      <div className="tile">
        <h2>Option</h2>
        <h1 className="option-text">{this.state.optionText}</h1>
        {responses}
      </div>
    );
  }
}

export default OptionShow;
