class AddSlugToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :slug, :string, unique: true
  end
end
