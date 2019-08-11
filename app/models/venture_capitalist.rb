class VentureCapitalist

    attr_reader :name

    @@all = []
    
    # VentureCapitalist#name returns a string that is the venture capitalist's name
    def initialize(name:)
        @name = name
        @@all << self
    end

    # VentureCapitalist.all returns an array of all venture capitalists
    def self.all
        @@all
    end
    
    # VentureCapitalist#total_worth returns a number that is the total worth of this 
    # investor (e.g., think of it as how much money they have)
    def total_worth
        find_amount = funding_rounds.map{|funding| funding.investment}
        find_amount.inject{|sum, el| sum + el}
    end
      
    # VentureCapitalist.tres_commas_club returns an array of all venture capitalists 
    # in the Trés Commas club (they have more then 1,000,000,000 total_worth)
    def self.tres_commas_club
        tres_comma = self.all.map do |venture|
            if venture.total_worth == nil
            elsif venture.total_worth> 1000000000
                venture
            end
        end
        tres_comma.compact
    end

    # VentureCapitalist#offer_contract given a startup object, type of investment (as a string), 
    # and the amount invested (as a float), creates a new funding round and associates it with 
    # that startup and venture capitalist.
    def offer_contract(startup, type, investment)
        FundingRound.new(startup: startup, venture_capitalist: self, type: type, investment: investment.to_f)
    end
    
    # VentureCapitalist#funding_rounds returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select{|funding| funding.venture_capitalist == self}
    end

    # VentureCapitalist#portfolio Returns a unique list of all startups this venture capitalist has 
    # funded
    def portfolio
        funding_rounds.map{|funding| funding.startup}.uniq
    end
    
    # VentureCapitalist#biggest_investment returns the largest funding round given by this venture 
    # capitalist
    def biggest_investment
        biggest_amount = 0
        funding_instance = 0

        funding_rounds.map do |funding| 
            if funding.investment > biggest_amount
                biggest_amount = funding.investment
                funding_instance = funding
            end
        end

        funding_instance
    end
    
    # VentureCapitalist#invested given a domain string, returns the total amount invested in 
    # that domain
    def invested(domain)
        get_total_funds = portfolio.map do |startup| 
            if startup.domain == domain
                startup.total_funds
            end
        end
        final_fund = get_total_funds.compact
        final_fund.inject{|sum, el| sum + el}
    end

end
