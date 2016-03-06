class AddAttachmentAvatarToExams < ActiveRecord::Migration
  def self.up
    change_table :exams do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :exams, :avatar
  end
end
