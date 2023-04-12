module ApplicationServerManagement
  class ApplicationServer < ApplicationRecord
    has_many :tokens

    def self.ransackable_attributes(auth_object = nil)
      ["code", "created_at", "description", "id", "name", "organisation_id", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["tokens"]
    end
  end
end
