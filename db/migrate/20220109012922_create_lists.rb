class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :title, null: false
      t.uuid :shared_id, null: false, default: 'gen_random_uuid()'

      t.timestamps
    end
    add_index :lists, :shared_id, unique: true
  end
end
