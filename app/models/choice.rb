class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :user_choices
  has_many :participants, :through => :user_choices
end


