class AddAttachmentAvatarToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :answers, :avatar
  end
end
