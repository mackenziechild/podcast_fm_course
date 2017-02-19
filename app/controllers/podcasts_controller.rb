class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show, :dashboard]
	before_action :find_episode, only: [:show, :dashboard]

	def index
		@podcasts = Podcast.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end

	def show
	end

	def dashboard
	end

	private

	def find_episode
		@episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def find_podcast
		if params[:id].nil?
			@podcast = current_podcast
		else
			@podcast = Podcast.find_by_slug(params[:id])
		end
	end
end
