class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name:, total_worth:)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        #given a startup object
        #return type of investment as a strin
        FundingRound.new(startup:startup, venture_capitalist: self, type:type, investment:amount)
    end

    def portfolio
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def funding_rounds
        portfolio.count
    end

    def biggest_investment
        portfolio.max_by {|investment| investment.investment}
    end

    def invested(domain)
        portfolio.select {|investment| investment.startup.domain == domain}.map{|domain| domain.investment}.reduce(:+)
    end

    

end
