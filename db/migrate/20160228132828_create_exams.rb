class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string   :title
      t.text     :description
      t.integer  :user_id
      t.integer  :subject_id
      t.belongs_to :category, index:true
      t.timestamps null: false
    end
  end
end
