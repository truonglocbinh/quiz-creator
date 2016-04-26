class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :exam_user
      t.integer	   :question_id
      t.integer	   :answer_id
      t.timestamps null: false
    end
  end
end
