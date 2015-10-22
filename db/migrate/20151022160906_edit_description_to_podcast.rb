class EditDescriptionToPodcast < ActiveRecord::Migration
  def change
  	remove_column :podcasts, :descrition, :text
  	add_column :podcasts, :description, :text
  end
end
