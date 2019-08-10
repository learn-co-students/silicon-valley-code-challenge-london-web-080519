class Startup

    attr_reader :founder, :domain, :name 


    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder 
        @domain = domain 
        @@all << self 
        @@domains << domain 
    end 

    def self.all 
        @@all 
    end 

    def pivot(domain, name)
        @domain = domain 
        @name = name 
    end 
    
    def self.domains 
        @@domains
    end


#     Startup#sign_contract
# given a venture capitalist object, type of investment 
# (as a string), and the amount invested (as a float), creates a new 
# funding round and associates it with that startup and venture capitalist.

    def sign_contract(venture_capitalist, type, investment)
        investment.to_f
        investment = 0 if investment < 0 
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds 
        self.startup_funding_rounds.count
    end 

    def total_funds 
        total = 0
        self.startup_funding_rounds.each { |round| total += round.investment}
        total 
    end 

    def investors
        self.startup_funding_rounds.map { |round| round.venture_capitalist}.uniq
    end

    def big_investors 
        self.investors & VentureCapitalist.tres_commas_club
    end 


    
end
