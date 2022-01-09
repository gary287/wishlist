class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :uuid do |t|
      t.string :title, null: false
      t.string :url
      t.boolean :purchased, null: false, default: false
      t.references :list, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
