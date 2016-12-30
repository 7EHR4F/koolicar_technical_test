class Event < ApplicationRecord
  after_create_commit { EventBroadcastJob.perform_later self }
  validates :message, presence: true
end
