class User < ActiveRecord::Base
  has_many :survey_participations, foreign_key: 'participant_id'
  has_many :surveys, :through => :survey_participations  
  # has_many :survey_participations
  has_many :user_choices
  has_many :choices, :through => :user_choices
end




# class User < ActiveRecord::Base
#   has_many :surveys, foreign_key: :creator_id   
#   has_many :participants, class_name: 'survey_participation'  #this doesnt seem right
#   has_many :user_choices
#   has_many :choices, :through => :user_choices
# end

