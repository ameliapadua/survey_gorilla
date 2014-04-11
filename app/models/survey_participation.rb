class SurveyParticipation < ActiveRecord::Base
  belongs_to :Survey
  belongs_to :participant, class_name: 'User'
end
