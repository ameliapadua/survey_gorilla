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

# post '' do

# end