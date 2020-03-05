# == Schema Information
#
# Table name: compartments
#
#  id         :integer          not null, primary key
#  active     :boolean          default("0"), not null
#  name       :string
#  returndate :date
#
class Compartment < ApplicationRecord
    validates :active, uniqueness: true, if: :active?

end
