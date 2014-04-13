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

enable :sessions

get '/create' do 
  @header = "Create"
  @name = "Name Your Survey"
  erb :'survey/create'
end

get '/update/:survey_id' do
  @header = "Update"
  @survey = Survey.find(params[:survey_id])
  @name = "Name Your Survey"
  @questions = @survey.questions
  erb :'survey/create'
end

post '/publish' do
  @user = current_user
  if params[:survey_id]
    p s = Survey.find(params[:survey_id])
    p params
  else
    s = Survey.create(title: params[:name], creator_id: @user.id)
    questions = params.map { |name, v| name if name.match(/^q{1}[0-9]+$/) }.compact
    p questions
    questions.each do |qid| 
      puts "IN QUESTIONS"
      p params[qid]
      q = Question.create(content: params[qid], survey_id: s.id)
        answers = params.map do |id, v| 
          puts "an id"
          p id
          missing = id.match(/a{1}[0-9]+/).to_s
          puts qid
          if missing && id == ( qid + missing )
            puts id
            id
          end
        end
        answers.compact!
        answers.each do |aid|
          c = Choice.create(content: params[aid], question_id: q.id)
          p c
        end
      # q.save
    end
    # p s.save
  end
  redirect '/surveys'
end
