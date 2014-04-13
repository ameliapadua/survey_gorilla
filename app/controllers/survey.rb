require 'json'

get '/surveys' do
  @surveys = Survey.all
  erb :'survey/index'
end

get '/surveys/:id' do
  survey = Survey.find(params[:id])
  @survey_json = survey.to_json(:include => { :questions => { :include => :choices}})
  erb :'survey/show'
end

post '/surveys/:id' do
  puts "Got to the controller!"
  puts "And the params are: #{params.inspect}"
  UserChoice.create(choice_id: params[:choice_id], participant_id: 1)
end

get '/results/:id' do
  puts "The params: #{params.inspect}"
  @survey = Survey.find(params[:id])   # this needs to change

  choice_participants = []
  @survey.questions.each do |question|
    question.choices.each do |choice|
       choice_participants << choice.participants.count   # this cant be the way
    end
  end
  @data = choice_participants.to_json   #an array of partipants in question order
  erb :'survey/results'
end
