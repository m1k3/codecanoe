class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.belongs_to :app, index: true
      t.belongs_to :build_configuration, index: true
      t.integer :status, null: false, default: 0
      t.text :notes

      t.timestamps
    end
  end
end
