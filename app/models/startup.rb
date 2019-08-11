class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    # Startup#name returns a string that is the startup's name
    # Startup#founder returns a string that is the founder's name
    # Once a startup is created, the founder cannot be changed.
    # Startup#domain returns a string that is the startup's domain
    # Once a startup is created, the domain cannot be changed (ie. A developer working with 
    # instances of the Startup class cannot directly change the domain)
    def initialize(name:, founder:, domain:)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    # Startup.all should return all of the startup instances
    def self.all
        @@all
    end
    
    # Startup#pivot given a string of a domain and a string of a name, change the domain and name 
    # of the startup. This is the only public method through which the domain can be changed.
    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end
    
    # Startup.find_by_founder given a string of a founder's name, returns the first startup whose 
    # founder's name matches
    def self.find_by_founder(founder_name)
        self.all.find{|startup| startup.founder == founder_name}
    end
    
    # Startup.domains should return an array of all of the different startup domains
    def self.domains
        self.all.map{|startup| startup.domain}.uniq
    end

    # Startup#sign_contract given a venture capitalist object, type of investment (as a string), 
    # and the amount invested (as a float), creates a new funding round and associates it with that 
    # startup and venture capitalist.
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: type, investment: amount.to_f)
    end
    
    # Startup#num_funding_rounds Returns the total number of funding rounds that the startup has gotten
    def fundings
        FundingRound.all.select{|funding| funding.startup == self}
    end

    def num_funding_rounds
        fundings.count
    end

    # Startup#total_funds Returns the total sum of investments that the startup has gotten
    def total_funds
        find_amount = fundings.map{|funding| funding.investment}
        find_amount.inject{|sum, el| sum + el}
    end
    
    # Startup#investors Returns a unique array of all the venture capitalists that have invested 
    # in this company
    def investors
        fundings.map{|funding| funding.venture_capitalist}.uniq
    end
    
    # Startup#big_investors Returns a unique array of all the venture capitalists that have invested 
    # in this company and are in the Trés Commas club
    def big_investors
        get_club = VentureCapitalist.tres_commas_club
        get_club & self.investors
    end

end
