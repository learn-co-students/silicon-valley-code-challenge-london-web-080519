class FundingRound
    @@all = []

    def self.all
        @@all
    end

    def initialize(startup:, venture_capitalist:, type:, investment:)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f        ### This should be a float that is not a negative number
        @@all << self
    end

    attr_reader :startup, :venture_capitalist, :type, :investment
end
