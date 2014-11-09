class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.belongs_to :movie, index: true

      t.timestamps
    end
  end
end
