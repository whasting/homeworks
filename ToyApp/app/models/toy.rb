# == Schema Information
#
# Table name: toys
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  toyable_id   :integer
#  toyable_type :string
#  created_at   :datetime
#  updated_at   :datetime
#

class Toy < ActiveRecord::Base
  validates :name, :toyable_id, presence: true
  validates :name, uniqueness: true
  validates :name, uniqueness: {scope: [:toyable_id, :toyable_type]}
  belongs_to :toyable, polymorphic: true
end
