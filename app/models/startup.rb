class Startup
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(founder)
        all.find{|startup| startup.founder == founder }
    end

    def self.domains
        all.map{|startup| startup.domain }
    end

    # Startup#sign_contract
    def sign_contract(venture_capitalist:, type:, investment:)
        FundingRound.new(startup:self, venture_capitalist: venture_capitalist, type: type, investment: investment)
    end

    def get_funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self }
    end

    # Startup#num_funding_rounds
    def num_funding_rounds
        get_funding_rounds.count
    end

    # Startup#total_funds
    def total_funds
        get_funding_rounds.map{|funding_round| funding_round.investment }.reduce(:+)
    end

    # Startup#investors
    def investors
        get_funding_rounds.map{|fr| fr.venture_capitalist }.uniq
    end
    
    # Startup#big_investors
    def big_investors
        investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor) }.uniq
    end

end
