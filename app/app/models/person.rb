class Person < ApplicationRecord
  belongs_to :workspace, inverse_of: :person
  belongs_to :job_role, inverse_of: :person
  has_many :contacts
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  validates :description, presence: true
  validates :registration, presence: true, uniqueness: true, length: { is: 6 }, numericality: { only_integer: true }
  validates_uniqueness_of :job_role_id, :scope => [:workspace_id]
  
end
