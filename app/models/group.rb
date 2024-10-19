class Group < ApplicationRecord
  has_many :user_and_group, dependent: :destroy
  has_many :users, through: :user_and_group
  
  validates :name, presence: true
  
  def self.search_by_title(title)
    where("title LIKE ?", "%#{sanitize_sql_like(title)}%")
  end
  
end
