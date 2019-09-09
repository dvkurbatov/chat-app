class CreatePrivateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :private_channels do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.timestamps
    end
  end
end
