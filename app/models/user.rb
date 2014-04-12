class User < ActiveRecord::Base
  has_many :survey_participations, foreign_key: 'participant_id'
  has_many :surveys, :through => :survey_participations  
  has_many :user_choices
  has_many :choices, :through => :user_choices
end
