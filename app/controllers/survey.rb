require 'json'

get '/surveys' do
  @surveys = Survey.all
  erb :'survey/index'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/show'
end

# post '/results' do
#   puts params
#   @choice_id = params[:choice]	
#   user_choice = UserChoice.new(choice_id: @choice_id, participant_id: 1)

#   if user_choice.save
#   	erb :results
#   else
#   	redirect '/surveys/:id'
#   end
# end

get '/results' do
  @survey = Survey.find(1)   # this needs to change

  choice_participants = []
  @survey.questions.each do |question|
    question.choices.each do |choice|
       choice_participants << choice.participants.count   # this cant be the way
    end
  end
  @data = choice_participants.to_json   #an array of partipants in question order
  erb :'survey/results'
end
