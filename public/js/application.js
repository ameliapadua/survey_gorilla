$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

 });




function Survey(surveyJson, complete) {
  this.surveyJson = surveyJson;
  this.id = surveyJson.survey.id;
  this.title = surveyJson.survey.title;
  this.questionIndex = 0;
  this.questions = surveyJson.survey.questions;
  this.complete = complete;
}

Survey.prototype.displayTitle = function(selector) {
  $(selector).append(this.title);
}

Survey.prototype.displayQuestion = function(question_selector, choices_selector) {
  var self = this;
  var currentQuestion = self.questions[self.questionIndex];
  console.log(this);

  $(question_selector).empty();
  $(choices_selector).empty();

  $(question_selector).append(currentQuestion.content);

  for (var i=0; i < currentQuestion.choices.length; i++) {
    $(choices_selector).append("<input type='radio' name=" + currentQuestion.id + " value=" + currentQuestion.choices[i].id + " />" + currentQuestion.choices[i].content + "<br>");
  }

  $('#choices input').click(function(e){
    e.preventDefault();

    var choice_data = {choice_id: this.value};

    $.post('/surveys/' + self.id, choice_data, function(response){
      self.questionIndex++;
      if (self.questionIndex < self.questions.length) {
        self.displayQuestion(question_selector, choices_selector);
      }
      else{
        complete();
      }
    });

  });

}


