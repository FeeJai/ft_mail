class CreateSnailmails < ActiveRecord::Migration[6.0]
  def change
    create_table :snailmails do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :compartment, foreign_key: true
      t.datetime :received_at
      t.date :returndate

    end
  end
end
