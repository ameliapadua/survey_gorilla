class CreateSurveyParticipations < ActiveRecord::Migration
  def change
  	create_table :survey_participations do |t|
  		t.integer :survey_id
  		t.integer :participant_id
  		t.timestamps
  	end
  end
end
