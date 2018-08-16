class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, length:{minimum: 100}
  validates :content, length:{minimum: 100}

end
