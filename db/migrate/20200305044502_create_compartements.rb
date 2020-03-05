class CreateCompartements < ActiveRecord::Migration[6.0]
  def change
    create_table :compartments do |t|
      t.boolean :active, null: false, default: false, unique: true
      t.string :name
    end
  end
end
