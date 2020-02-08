class Theme < ApplicationRecord
  belongs_to :user, optional: true
  has_many :paraphrases, dependent: :destroy
  validates :question, presence: true
  # accepts_nested_attributes_for :paraphrases, allow_destroy: true
end
