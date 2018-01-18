class DetailsForm
  include ActiveModel::Model

  attr_accessor :name, :email

  validates :name, :email, presence: true

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  def attributes
    {name: name, email: email}
  end
end
