class Shot < ActiveRecord::Base
	attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	belongs_to :comedian
  attr_accessible :comedian_id, :name

	def avatar_url
		self.avatar.url
	end
end
