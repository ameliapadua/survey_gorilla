class CreateUserChoices < ActiveRecord::Migration
  def change
  	create_table :user_choices do |t|
  		t.integer :choice_id
  		t.integer :participant_id
  	end
  end
end
