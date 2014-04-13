get '/surveys' do
  @surveys = Survey.all
  erb :'survey/index'
end

get '/surveys/:id' do
  puts "The params: #{params.inspect}"
  survey = Survey.find(params[:id])
  @survey_json = survey.to_json(:include => { :questions => { :include => :choices}})
  erb :'survey/show'
end

post '/surveys/:id' do
  puts "Got to the controller!"
  puts "And the params are: #{params.inspect}"
  UserChoice.create(choice_id: params[:choice_id], participant_id: 1)
end

get '/results' do
  @survey = Survey.find(1)
  erb :'survey/results'
end