class Podcast < ActiveRecord::Base

	after_create :update_slug
	before_update :generate_slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :episodes

  validates_uniqueness_of :slug

  has_attached_file :thumbnail, :styles => { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  def episodes_count
  	episodes.count
  end

  def to_param
  	slug
  end

  private
  
  def generate_slug
    self.slug = title.parameterize
  end

  def update_slug
  	update_attributes slug: generate_slug
  end

end
