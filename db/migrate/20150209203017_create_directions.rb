class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.text :steps
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
