class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

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
        all.select{|vent_caps| vent_caps.total_worth > 1000000000}
    end
    
    # VentureCapitalist#offer_contract
    # given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract(startup:, type:, investment:)
        FundingRound.new(startup: startup, type: type, investment: investment, venture_capitalist: self)
    end

    # VentureCapitalist#funding_rounds
    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end


    # VentureCapitalist#portfolio
    # Returns a **unique** list of all startups this venture capitalist has funded
    def portfolio
        funding_rounds.map{|fr| fr.startup }.uniq
    end

    # VentureCapitalist#biggest_investment
    # returns the largest funding round given by this venture capitalist
    def biggest_investment
        funding_rounds.map{|fr| fr.investment }.max
    end

    # VentureCapitalist#invested
    # given a **domain string**, returns the total amount invested in that domain
    def invested(domain)
        frs_by_domain = funding_rounds.select{|fr| fr.startup.domain == domain }
        list_of_investments = frs_by_domain.map{|fr| fr.investment}
        list_of_investments.reduce(:+)
    end

end
