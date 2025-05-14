class CreateSunsets < ActiveRecord::Migration[8.0]
  def change
    create_table :sunsets do |t|
      t.timestamps
    end
  end
end
