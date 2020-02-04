class Paraphrase < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :theme, optional: true
end
