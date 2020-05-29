class Isp < ApplicationRecord
    has_many :clients

    def isp_info
        [self.name, self.email]
    end

end
