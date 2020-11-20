class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :text,     nill: false
      t.references :user
      t.references :prototype
      t.integer :user_id
      t.integer :prototype_id

      t.timestamps
    end
  end
end
