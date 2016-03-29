class CreateExamGroups < ActiveRecord::Migration
  def change
    create_table :exam_groups do |t|
      t.belongs_to :exam
      t.belongs_to :group
      t.timestamps null: false
    end
  end
end
