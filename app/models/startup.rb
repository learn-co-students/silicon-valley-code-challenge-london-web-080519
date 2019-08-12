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
    

end
