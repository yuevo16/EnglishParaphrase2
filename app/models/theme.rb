class Theme < ApplicationRecord
  belongs_to :user, optional: true
  has_many :paraphrases
  validates :question, presence: true
end
