class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.integer :survey_id
  		t.integer :order_number
  		t.string :content
  	end
  end
end
