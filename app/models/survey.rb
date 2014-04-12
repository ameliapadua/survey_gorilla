class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :questions
  has_many :survey_participations
  has_many :participants, :through => :survey_participations    # user/users???
end

