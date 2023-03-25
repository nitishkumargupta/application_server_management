module ApplicationServerManagement
  class Token < ApplicationRecord
    belongs_to :application_server
  end
end
