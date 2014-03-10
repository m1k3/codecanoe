class CreateBuildConfigurations < ActiveRecord::Migration
  def change
    create_table :build_configurations do |t|
      t.string :name
      t.text :commands
      t.belongs_to :app, index: true

      t.timestamps
    end
  end
end
