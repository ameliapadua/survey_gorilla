require 'faker'


#10 users
10.times do
  name = Faker::Name.name
  email =  Faker::Internet.email
  password = "password"
  User.create(name: name, email: email, password: password )	
end

#3 surveys
3.times do
	title = Faker::Lorem.word
  user = User.all.sample
  Survey.create(title: title, creator_id: user.id)
end

#20 survey Participations
Survey.all.each do |survey|
  User.all.each do |user|
    SurveyParticipation.create(survey_id: survey.id, participant_id: user.id)
  end
end

    
# 20.times do
# 	survey = Survey.all.sample
# 	user = User.all.sample
# 	SurveyParticipation.create(survey_id: survey.id, participant_id: user.id)
# end


#10 questions
order_number = 1
10.times do 
	survey = Survey.all.sample
	content = Faker::Lorem.sentence
  Question.create(content: content, survey_id: survey.id, order_number: order_number)
  order_number += 1
end

#choices
4.times do
question = Question.all.each do |question|
   content = Faker::Lorem.word
   # 4.times do   # each question has four choices # WRONG!
   Choice.create(content: content, question_id: question.id)
   # end
  end
end

#userchoices
User.all.each do |user|
  Survey.all.each do |survey|
    survey.questions.each do |question|
       choice = question.choices.sample
	      UserChoice.create(choice_id: choice.id, participant_id: user.id,)
    end
  end
end
