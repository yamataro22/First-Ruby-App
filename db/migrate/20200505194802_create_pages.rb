class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :subject_id
      t.string  :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, :default => false
      t.timestamps
    end
    add_index("pages", :subject_id) #when we have a foreing key we want an index for it
    add_index("pages", :permalink)
  end
end
