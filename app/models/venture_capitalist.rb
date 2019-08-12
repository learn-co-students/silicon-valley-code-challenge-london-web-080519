class VentureCapitalist
    @@all = []

    def self.all
        @@all
    end

    def initialize(name:, total_worth:)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    attr_reader :name
    attr_accessor :total_worth

    def self.tres_commas_club
        @@all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup:, type:, amount:)
        FundingRound.new(venture_capitalist: self, startup: startup, type: type, investment: amount)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|round| round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by{|round| round.investment}
    end

    def get_domain_rounds(domain:)
        funding_rounds.select{|round| round.startup.domain == domain}
    end

    def invested(domain:)
        get_domain_rounds(domain: domain).map{|round| round.investment}.sum
    end
end
