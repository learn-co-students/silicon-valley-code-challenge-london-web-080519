class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain:, name:) #string of domain and name
        #change the domain and name of the startup. 
        #This is the only public method through which the domain can be changed.
        @domain = domain
        @name = name
        self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(vc, type, amount)
        fundingreceived = FundingRound.new(startup: self, venture_capitalist: vc, type: type, investment: amount)
    end

    def myfunding
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        myfunding.count
    end

    def total_funds
        myfunding.map{|myfunds| myfunds.investment}.reduce(:+)
    end

    def investors
        myfunding.map{|myfunds| myfunds.venture_capitalist}
    end

    def big_investors
        investors.filter{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end


end
