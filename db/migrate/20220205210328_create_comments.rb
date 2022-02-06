class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
