class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
