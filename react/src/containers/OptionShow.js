import React, { Component } from 'react';
import ResponseBox from '../components/ResponseBox'

class OptionShow extends Component {
  constructor(props){
    super(props);
    this.state = {
      optionId: parseInt(document.getElementById('option-show').dataset.id),
      questionId: null,
      nextOptionId: null,
      optionText: null,
      optionNotes: null,
      selectedResponseId: null,
      selectedResponseScore: null
    };
    this.handleSelectedResponse = this.handleSelectedResponse.bind(this);
    this.addNewResponse = this.addNewResponse.bind(this);
    this.handleNext = this.handleNext.bind(this);
  }

  componentDidMount(){
    fetch(`/api/v1/options/${this.state.optionId}`)
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(option => {
      this.setState({
        questionId: option.question_id,
        optionText: option.text,
        optionNotes: option.notes,
      });
      if (option.next_option !== null) {
        this.setState({ nextOptionId: option.next_option.id });
      }
    });
  }

  handleSelectedResponse(responseId, responseScore) {
    if (this.state.selectedResponseId === responseId) {
      this.setState({ selectedResponseId: null });
      this.setState({ selectedResponseScore: null })
    } else {
      this.setState({ selectedResponseId: responseId });
      this.setState({ selectedResponseScore: responseScore });
    }
  }

  addNewResponse(newResponse) {
    fetch(`/api/v1/options/${this.state.optionId}/responses`, {
      body: JSON.stringify(newResponse),
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json' },
      method: 'POST'
    })
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(message => {
      if (message.message == "It worked!") {
        console.log("It worked!");
      }
    });
  }

  handleNext(event) {
    let newResponseData = {
      score: this.state.selectedResponseScore,
      option_id: this.state.optionId
    };
    this.addNewResponse(newResponseData);
  }

  render(){
    let className;
    let responseObject = {"please-no": ["Please no!", -3], "rather-not": ["I’d rather not.", -1], "sure": ["Sure!", 1], "please-yes": ["Please yes!!!", 2]};
    let responseArray = Object.keys(responseObject);

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

    let link
    let linkText

    if (this.state.nextOptionId === null) {
      link = `/questions/${this.state.questionId}/thanks`
      linkText = "Finish"
    } else {
      link = `/options/${this.state.nextOptionId}`;
      linkText = "Next Option";
    }


    let button;
    if (this.state.selectedResponseId !== null) {
      button =
        <div className="center float">
          <h2 className="button" onClick={this.handleNext}><a href={link}>{linkText}</a></h2>
        </div>
    }

    return(
      <div>
        <div className="tile">
          <div className="option-text">
            <h1>{this.state.optionText}</h1>
            <p>{this.state.optionNotes}</p>
          </div>
          {responses}
        </div>
        {button}
        <div className="spacer-small"></div>
      </div>
    );
  }
}

export default OptionShow;
