get '/surveys' do
  @surveys = Survey.all
  erb :'survey/index'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/show'
end
