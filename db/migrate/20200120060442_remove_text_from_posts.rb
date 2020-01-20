class RemoveTextFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :text, :text
  end
end
