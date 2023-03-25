module ApplicationServerManagement
  class ApplicationServer < ApplicationRecord
    has_many :tokens
  end
end
