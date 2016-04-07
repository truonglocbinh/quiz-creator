class CreateExamUsers < ActiveRecord::Migration
  def change
    create_table :exam_users do |t|
      t.belongs_to :user
      t.belongs_to :exam
      t.belongs_to :group
      t.integer    :status
      t.datetime   :start_date
      t.datetime   :end_date
      t.timestamps null: false
    end
  end
end
