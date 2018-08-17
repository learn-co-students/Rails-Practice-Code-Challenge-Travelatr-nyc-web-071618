class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {minimum: 0}
  validates :bio, length: {minimum: 30}

  def featured_post
    like_count = -1
    self.posts.each do |post|
      if post.likes > like_count
        like_count = post.likes
        @hot_post = post
      end
    end
    @hot_post
  end

  def total_likes
    @likes = 0
    self.posts.each do |post|
      @likes += post.likes
    end
    @likes
  end

end
