# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
#  uid          :integer
#  virtual_room :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[ft_api]
  validates_numericality_of :virtual_room, only_integer: true, in: 10_000..99_999, uniqueness: true
  #attr_accessor :virtual_room

  def self.from_omniauth(auth)
    where(uid: auth.extra.raw_info.id).first_or_create do |user|
      user.email = auth.extra.raw_info.email
      # user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      user.virtual_room = user.verify_virtual_room
    end
  end

  def verify_virtual_room
    return if virtual_room?

    # This is a bad algorithm likely to cause high load and timeouts once this gets more popular
    # TODO: replace with something better!
    random_id = rand(10_000..99_999)
    while User.unscoped.where(virtual_room: random_id).exists?
        random_id = rand(10_000..99_999)
    end
    random_id
  end

  def virtual_room_print
	virtual_room.to_s + jankowski_checksum(virtual_room)
  end

  protected

  def jankowski_checksum(number)
    chars = 'ACDEFGHIJKLMNPQRSTVWXYZ'
    checksum = 0
    iterator = 1
    quotient = number
    until quotient.zero?
      quotient, modulus = quotient.divmod(10) # one go!
      checksum += (modulus + 1) * iterator
      iterator += 1
    end
    chars[checksum % 23]
  end
end
