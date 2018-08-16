class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :bio, length:{minimum: 30}

  def likes
    like = 0
    self.posts.each do |post|
      like += post.likes
    end
    like
  end

  def top_posts_arranged
    self.posts.sort_by{|post| post.likes}.reverse
  end

  def top_post
    top_posts_arranged.first
  end

  def top_destinations
    sorted = self.destinations.sort_by{|destination| destination.posts.count}.reverse
    if sorted.count > 5
    sorted[0..4]
    else
      sorted
    end
  end
end
