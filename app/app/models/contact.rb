class Contact < ApplicationRecord
    belongs_to :person

    validates :telephone, presence: true, length: { maximum: 13 }
    validates :cell_phone, presence: true, length: { maximum: 14 }
    validates :email, presence: true, uniqueness: true

    validates_uniqueness_of :telephone, :scope => [:person_id]
    validates_uniqueness_of :cell_phone, :scope => [:person_id]
    validates_uniqueness_of :email, :scope => [:person_id]

end
