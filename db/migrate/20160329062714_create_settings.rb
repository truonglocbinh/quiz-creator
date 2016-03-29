class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.belongs_to :exam, index: true
      t.integer :score, default: 100
      t.integer :time_limit, default: 0
      t.boolean :order_question, default: false
      t.boolean :order_answer, default: false
      t.boolean :send_email, default: false
      t.timestamps null: false
    end
  end
end
