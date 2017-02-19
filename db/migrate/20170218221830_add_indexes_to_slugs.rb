class AddIndexesToSlugs < ActiveRecord::Migration
  def change
  	add_index :episodes, :slug
  	add_index :podcasts, :slug
  end
end
