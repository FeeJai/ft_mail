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

	def self.from_omniauth(auth)
		where(uid: auth.extra.raw_info.id).first_or_create do |user|
		  user.email = auth.extra.raw_info.email
		  # user.password = Devise.friendly_token[0, 20]
		  user.first_name = auth.extra.raw_info.first_name
		  user.last_name = auth.extra.raw_info.last_name
		  # If you are using confirmable and the provider(s) you use validate emails, 
		  # uncomment the line below to skip the confirmation emails.
		  # user.skip_confirmation!
		end
	  end
	  


end
