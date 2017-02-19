class AddHitsToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :hits, :integer, default: 0
  end
end
