class Listing < ApplicationRecord
  validates_presence_of :title, :description, :picture
  belongs_to :category
  belongs_to :user
  has_many :comments
  mount_uploader :picture, PictureUploader

  def self.search(params)
    if params[:category_id]
      @listings = Listing.where(["category_id = ?", params[:category_id]])
    else
      @listings = Listing.where("title ILIKE :query", query: "%#{params[:keywords]}%")
    end
  end
end
