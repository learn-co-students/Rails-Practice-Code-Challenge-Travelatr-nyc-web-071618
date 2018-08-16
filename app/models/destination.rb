class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def post_arranged
    self.posts.sort_by{|post| post.likes}.reverse
  end

  def recent_five_posts
    if post_arranged.count > 5
    self.posts[-4..-1]
    else
      post_arranged
    end
  end

  def most_popular
    post_arranged.first
  end

  def blogger_average_age
    total = 0
    self.bloggers.uniq.each do |blogger|
      total += blogger.age
    end
    total/self.bloggers.uniq.count
  end
end
