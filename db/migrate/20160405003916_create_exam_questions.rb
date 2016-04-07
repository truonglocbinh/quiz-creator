class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.belongs_to :exam
      t.belongs_to :group
      t.string     :title
      t.text       :feedback
      t.integer    :question_type
      t.integer    :score, default: 1
      t.timestamps null: false
    end
  end
end
