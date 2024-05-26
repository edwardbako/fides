class Appeal < ApplicationRecord

  validates_presence_of :name, :email, :subject, :body
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
