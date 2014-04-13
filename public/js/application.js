$(document).ready(function() {



// create a js array of all questions
// get the number of elements in that array
// create an categories array that has the same number of elements - each element being 'Question X'

//create an array where each element is the number of participant per question -- in order

var number_of_questions = parseInt($('.number_of_questions').html()) // WORKS!!!
console.log(number_of_questions)

var categories = new Array(number_of_questions)
for(var i = 0; i < number_of_questions * 4 + 1 ; i += 1) {
  categories[i] = 'Answer' + (i +1)
}

    
	   $(function () { 
	    $('#container').highcharts({
	        chart: {
	            type: 'bar'
	        },
	        title: {
	            text: 'Survey Records'
	        },
	        xAxis: {
	            categories: categories // amount of questions
	        },
	        yAxis: {
	            title: {
	                text: 'Amount of Participants'
	            }
	        },
	        series: [{
	            name: 'Participants',
	            data:  data//[1, 2, 4, 15,]  // amount of participants per question
	     
	        }]
	    });
	});
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
        complete("/results/" + self.id);
      }
    });

  });

}



