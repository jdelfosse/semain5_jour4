class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :childs, class_name: "Comment", as: :commenteable
 end
