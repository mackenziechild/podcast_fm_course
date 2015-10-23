class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.references :podcast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
