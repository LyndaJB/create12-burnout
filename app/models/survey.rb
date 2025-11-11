class Survey < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :unanswered, -> {
    where(answered_at: nil)
  }
end
