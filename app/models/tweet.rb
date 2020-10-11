class Tweet < ApplicationRecord
    has_many :likes
    belongs_to :user
    scope :created_at, -> (first, last) { where('created_at >= ? AND created_at <=?', first, last) }
end
