import React, { Component } from 'react';

class QuestionShowTile extends Component {
  constructor(props){
    super(props);
    this.state = {
      question: []
    };
  }

  componentDidMount(){
    let app = document.getElementById('app');
    let questionId = app.dataset.id;
    fetch(`/api/v1/questions/${questionId}`)
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(question => {
      this.setState({ question: question });
    });
  }

  copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
  }

  render(){
    return(
      <div className="tile">
        <h2>Question</h2>
        <h1>{ this.state.question.text }</h1>

        <br />

        <p>This question is using a tiny little group decision making app that helps groups make decisions quickly and precisely. You will anonymously and honestly rate options, one by one, and when the question is closed, your group will know what to do.</p>

        <br />

        <h2 className="button">
          <a href={'/options/' + this.state.question.id}>Begin</a>
        </h2>

        <br />

        <h2 onclick="copyToClipboard('#url')" className="clickable">Copy link to question</h2>
        <p className="hidden" id="url">{window.location["href"]}</p>

        <h2 className="clickable">{window.location["href"]}</h2>

        <h2><a href={'/questions/' + this.state.question.id + '/results'}>Close question</a></h2>
      </div>
    )
  }
}

export default QuestionShowTile;

// NOTE: You need this on your Rails page for this to work: <div id="app" data-id="<%= @question.id %>"></div>
