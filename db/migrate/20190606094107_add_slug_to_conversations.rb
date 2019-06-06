class AddSlugToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :slug, :string
    add_index :conversations, :slug, unique: true
  end
end
