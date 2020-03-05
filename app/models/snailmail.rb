# == Schema Information
#
# Table name: snailmails
#
#  id             :integer          not null, primary key
#  received_at    :datetime
#  returndate     :date
#  compartment_id :integer
#  user_id        :integer
#
# Indexes
#
#  index_snailmails_on_compartment_id  (compartment_id)
#  index_snailmails_on_user_id         (user_id)
#
# Foreign Keys
#
#  compartment_id  (compartment_id => compartments.id)
#  user_id         (user_id => users.id)
#
class Snailmail < ApplicationRecord
    belongs_to :user
    belongs_to :compartment

end
