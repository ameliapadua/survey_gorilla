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

