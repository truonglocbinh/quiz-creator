class AddPassToExam < ActiveRecord::Migration
  def change
  	add_column :settings, :pass, :integer, default: 1
  end
end
