class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :time
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
