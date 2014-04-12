class SurveyParticipation < ActiveRecord::Base
  validates_uniqueness_of :participant_id, scope: :survey_id
  belongs_to :survey
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
end
