class RegisteredApplication < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :user, presence: true
end
