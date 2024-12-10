class Computer < ApplicationRecord
    paginates_per 10

    def self.ransackable_attributes(auth_object = nil)
        %w[name brand description price]
    end
end
