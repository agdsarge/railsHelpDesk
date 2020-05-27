class Professional < ApplicationRecord
    has_many :tickets
    has_many :clients, through: :tickets
    has_secure_password

    def self.find_least_busy_pro(task_description)
        specialists = self.select {|p| p.specialty == task_description}
        specialists_workload = specialists.map  {|s| s.tickets.count {|t| t.open == true}}
        min_workload = specialists_workload.min
        x = specialists_workload.find_index(min_workload)
        specialists[x]
    end

end
