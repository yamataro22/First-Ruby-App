class Page < ApplicationRecord


    scope :sorted, lambda { order("position ASC") }

    belongs_to :subject
    has_many :sections
    has_and_belongs_to_many :admin_users
end
