class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :comment,
    allow_blank: true,
    length: { maximum: 30 }
end
