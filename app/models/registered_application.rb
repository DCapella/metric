class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :user, presence: true
end
