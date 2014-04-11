class UserChoice < ActiveRecord::Base
  belongs_to :participant, class_name: 'User'
  belongs_to :choice
end
