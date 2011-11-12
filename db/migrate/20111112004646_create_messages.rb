class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :message, :limit => 500

      t.timestamps
    end
  end
end
