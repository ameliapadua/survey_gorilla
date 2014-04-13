
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
  @survey = Survey.find(1)
  erb :'survey/results'
end

enable :sessions

get '/create' do 
  @header = "Create"
  @name = "Name Your Survey"
  erb :'survey/create'
end

get '/update/:survey_id' do
  @header = "Update"
  @survey = Survey.find(params[:survey_id])
  name = @survey.name
  questions = @survey.questions
  erb :'survey/create'
end

post '/publish' do
  p params
end
