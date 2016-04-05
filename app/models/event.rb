class Event < ActiveRecord::Base
  mount_uploader :event_image, EventImageUploader

  belongs_to :owner, class_name: 'User'
  has_many :tickets, dependent: :destroy

  validates :name,
    presence: true,
    length: { maximum: 50 }

  validates :place,
    presence: true,
    length: { maximum: 100 }

  validates :start_time,
    presence: true

  validates :end_time,
    presence: true

  validates :content,
    presence: true,
    length: { maximum: 2000 }

  validate :start_time_should_be_before_end_time

  def created_by?(user)
    user && owner_id == user.id
  end

  def ticket_of(user)
    return unless user
    tickets.find do |t|
      t.user_id == user.id
    end
  end

  private

  def start_time_should_be_before_end_time
    return unless start_time && end_time

    if start_time > end_time
      errors.add :start_time, 'は終了時間よりも前に設定してください'
    end
  end
end
