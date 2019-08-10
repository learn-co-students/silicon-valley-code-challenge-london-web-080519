class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth 
        @@all << self 
    end 

    def self.all 
        @@all 
    end

    def self.tres_commas_club
        self.all.select { |company| company.total_worth > 10000000000}
    end 

    def offer_contract(startup, type, investment)
            investment.to_f
            investment = 0 if investment < 0 
            FundingRound.new(startup, self, type, investment)
        end 

    def funding_rounds 
        FundingRound.all.select { |round| round.venture_capitalist == self}
    end 

    def portfolio 
        self.funding_rounds.map { |round| round.startup }.uniq
    end 

    def biggest_investment 
        max_investment = 0 
        max_round = nil 
        self.funding_rounds.each do |round| 
            if round.investment > max_investment 
                max_investment = round.investment
                max_round = round 
            end 
        end 
        max_round 
    end 

    def invested(domain)
        total = 0 
        self.funding_rounds.each {|round| total += round.investment if round.startup.domain == domain }
        total 
    end 

     

    




end
