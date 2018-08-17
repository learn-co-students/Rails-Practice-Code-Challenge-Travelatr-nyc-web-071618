class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def five_most_recent
    recent_five = []
    i = -1
    5.times do
      if self.posts[i] != nil
        recent_five << self.posts[i]
        i -= 1
      end
    end
    recent_five
  end

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

  def average_age
    bloggers_array = []
    age_array = []
    self.posts.each do |post|
      bloggers_array << post.blogger
    end
    unique_bloggers = bloggers_array.uniq
    # byebug
    unique_bloggers.each do |blogger|
      age_array << blogger.age
    end
    age_array.sum / age_array.size
  end



  # def display_five_recent
  #   self.five_most_recent.each do |post|
  #     post.title
  #   end
  # end

end
