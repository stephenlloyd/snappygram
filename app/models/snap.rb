class Snap < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessible :description, :image
  acts_as_taggable_on :tags

  def self.upload_new_with(params)
  	snap = new(snap_params(params))
  	snap.tag_list= params[:snap][:tag_list]
  	snap
  end

  after_save do | snap |
  	Pusher.url = "http://41d4ff4435428bdfddaf:ccc90fcff094d4861a0f@api.pusherapp.com/apps/67690"
    Pusher.trigger('snap', 'upload', { id: snap.id, image: snap.image.url(:medium),
    	description: snap.description, tags: snap.tag_list})
  end

  private
  def self.snap_params(params)
  	{description: params[:snap][:description], image: params[:snap][:image]}
  end
end
