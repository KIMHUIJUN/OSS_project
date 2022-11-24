class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.text :src
      t.text :intro
      t.references :track, foreign_key: true

      t.timestamps
    end
  end
end