class User < ActiveRecord::Base
  validates :name, uniqueness: true
  # validates :password, uniqueness: true

  has_many :surveys, foreign_key: :creator_id
  has_many :participants, class_name: 'survey_participation'
  has_many :user_choices
  has_many :choices, :through => :user_choices
end

