class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  
    def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    return profile_image.variant(resize_to_limit: [width, height]).processed
    end
  
end
