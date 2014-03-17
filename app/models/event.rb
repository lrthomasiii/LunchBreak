class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true
  dateFormatValidation = /\d{2}\/\d{2}\/\d{4}/
  validates :date, format: {with: dateFormatValidation}
  timeFormatValidation = /\d{2}:\d{2}/
  validates :time, format: {with: timeFormatValidation}
  validates :description, length: {maximum: 150}, presence: true
end
