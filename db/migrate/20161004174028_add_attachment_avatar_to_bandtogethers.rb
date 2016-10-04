class AddAttachmentAvatarToBandtogethers < ActiveRecord::Migration
  def self.up
    change_table :bandtogethers do |t|
      t.attachment :bandtogether_avatar
    end
  end

  def self.down
    remove_attachment :bandtogethers, :bandtogether_avatar
  end
end
