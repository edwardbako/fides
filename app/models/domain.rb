class Domain < ApplicationRecord

  validates_presence_of :name, :cost
  validates :name, format: {
      with: /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
      message: "This is not a valid domain name."
    }
end
