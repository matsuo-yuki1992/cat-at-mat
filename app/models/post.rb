class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_one_attached :post_image
  
  validates :title, presence: true
  validates :body, length: {maximum: 200}, presence: true
  
  def self.search_by_title(title)
    where("title LIKE ?", "%#{sanitize_sql_like(title)}%")
  end
  
  def get_profile_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
