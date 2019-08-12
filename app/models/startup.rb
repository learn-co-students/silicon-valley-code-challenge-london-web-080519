class Startup
    @@all = []

    def self.all
        @@all
    end

    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    attr_accessor :name
    attr_reader :founder, :domain

    def pivot(domain:, name:)
        @domain = domain
        self.name = name
    end

    def self.find_by_founder(name:)
        @@all.find {|startup| startup.founder == name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist:, type:, amount:)
        FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type, investment: amount)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map{|round| round.investment}.sum
    end

    def investors
        funding_rounds.map{|round| round.venture_capitalist}
    end

    def big_investors
        investors.select{|investor| investor.total_worth > 1000000000}
    end
end
