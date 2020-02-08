class Paraphrase < ApplicationRecord
  validates :answer, presence: true
  belongs_to :user, optional: true
  belongs_to :theme, optional: true
  has_many :comments, ->{order("created_at DESC") },dependent: :destroy
end
