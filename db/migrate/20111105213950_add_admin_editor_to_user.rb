class AddAdminEditorToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :editor, :boolean
  end
end
