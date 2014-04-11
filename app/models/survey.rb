class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :questions
  has_many :survey_participants
  has_many :participants, :through => :survey_participants, :source => :participant    # user???
end

