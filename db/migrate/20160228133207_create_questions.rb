class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title
      t.text       :feedback
      t.integer    :question_type
      t.integer    :score, default: 1
      t.belongs_to :exam
      t.belongs_to :subject
      t.timestamps null: false
    end
  end
end
