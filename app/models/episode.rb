class Episode < ActiveRecord::Base
  
  after_create :update_slug
  before_update :generate_slug

  belongs_to :podcast

  has_attached_file :episode_thumbnail, :styles => { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :episode_thumbnail, :content_type => /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }

  scope :most_featured, -> { order("hits DESC").limit(5) }

  def to_param
  	slug
  end

  def hit
  	Episode.where(id: id).update_all("hits=hits+1")
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end

  def update_slug
  	update_attributes slug: generate_slug
  end

  def others
    podcast.episodes.where("id <> ?", id).order("created_at DESC").limit(6)
  end
end
