class Order < ApplicationRecord
  has_one :item, dependent: :nullify
  belongs_to :user, optional: true

  enum status: [:required, :completed, :canceled]

  scope :not_required, -> { where.not(status: :required) }
  # scope :cancled, -> { where.(created_at: nil) }

end
