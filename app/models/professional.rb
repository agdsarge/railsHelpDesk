class Professional < ApplicationRecord
    has_many :tickets
    has_many :clients, through: :tickets
    has_secure_password

    def self.find_least_busy_pro(task_description)
        specialists = self.select {|p| p.specialty == task_description}
        unless specialists.empty?
            specialists_workload = specialists.map  {|s| s.tickets.count {|t| t.open == true}}
            min_workload = specialists_workload.min
            x = specialists_workload.find_index(min_workload)
            return specialists[x]
        else
            pros = Professional.all
            all_pro_workload = pros.map {|p| p.tickets.count {|t| t.open == true}}
            min_workload = all_pro_workload.min
            y = all_pro_workload.find_index(min_workload)
            return pros[y]
        end
    end

    def first_name
        self.name.split[0]
    end

    def last_name
        self.name.split[-1]
    end

    def pro_open_tix
        Ticket.all.select {|t| t.professional == self && t.open}
    end

    def pro_closed_tix
        Ticket.all.select {|t| t.professional == self && !t.open}
    end

    def pro_info
        [self.name, self.email, "Specialist in #{self.specialty}"]
    end

end
