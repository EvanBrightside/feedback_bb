class Reply < ApplicationRecord
  cattr_accessor :current_user

  validates :message, presence: true

  belongs_to :feedback, required: true
end
