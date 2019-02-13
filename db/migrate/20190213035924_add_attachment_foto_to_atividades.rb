class AddAttachmentFotoToAtividades < ActiveRecord::Migration[5.2]
  def self.up
    change_table :atividades do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :atividades, :foto
  end
end
