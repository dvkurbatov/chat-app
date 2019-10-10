class ChangeColumnsToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :user_id, :author_id
    rename_column :messages, :channel_id, :listener_id
    add_column :messages, :listener_type, :string
  end
end
