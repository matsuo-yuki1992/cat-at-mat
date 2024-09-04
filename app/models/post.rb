class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_one_attached :post_image
  
  validates :title, presence:true
  validates :body, length:{maximum: 200}, presence:true
  
  def get_profile_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    return post_image.variant(resize_to_limit: [width, height]).processed
    end
    
end
