$(document).ready(function() {

  var qCount = 1;
  var new_answer = function (id) {
    return '<li><input type="text" name="a'+id+'" id="a'+id+'" placeholder="Answer"><span class="removeA">   x</span></li>'
  };
  var new_question = function (id) {
    return  '<input type="text" name="q'+id+'" id="q'+id+'" placeholder="Question"><span class="removeQ">   x</span>' + 
            '<div class="addA">  +</div>' +
              '<ul class="answers">' +
                '<li><input type="text" name="a1" id="a1" placeholder="Answer"><span class="removeA">   x</span></li>' + 
              '</ul>';
  };
  
  //add initial question to the DOM
  $('form').append($(new_question(qCount)));
  //remove a question    
  $(document).on('click','.removeQ', function(){
    qCount--;
    $(this).prev().remove();
    $(this).next().remove()
    $(this).next().children().andSelf().remove();
    $(this).remove();
  });
  //add a new question
  $(document).on('click','#addQ', function(){
    qCount++;
    $('form').append($(new_question(qCount)));
  });
  //remove an answer
  $(document).on('click','.removeA', function() {
    $(this).prev().remove();
    $(this).remove();
  });
  //add an answer
  $(document).on('click','.addA',function() {
    var answers = $(this).next();
    id = answers.find('li').size() + 1;
    answers.append(new_answer(id));
  });

  // TODO validations, reordering, ajax messages
});