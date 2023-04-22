module ApplicationServerManagement
  class ApplicationServer < ApplicationRecord
    has_many :tokens
    belongs_to :organisation

    alias_attribute :organization_id, :organisation_id
    serialize :alert_response_codes, Array

    def self.ransackable_attributes(auth_object = nil)
      ["code", "created_at", "description", "id", "name", "organisation_id", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["tokens"]
    end
  end
end
