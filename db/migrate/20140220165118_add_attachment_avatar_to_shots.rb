class AddAttachmentAvatarToShots < ActiveRecord::Migration
  def self.up
    change_table :shots do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :shots, :avatar
  end
end
