require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#name, founder, domain
my_super_business = Startup.new(name: "Super Business", founder: "Erin", domain: "tech")
bens_business = Startup.new(name: "Great Business", founder: "Ben", domain: "tech")
business3 = Startup.new(name: "Business 3", founder: "Neil", domain: "healthcare")


vc1 = VentureCapitalist.new(name: "Figaro", total_worth: 1000000001)
vc2 = VentureCapitalist.new(name: "PoBoy", total_worth: 100)

fr1 = FundingRound.new(startup: my_super_business, venture_capitalist:vc1, type: "Angel", investment: 10000.00)
fr2 = FundingRound.new(startup: bens_business, venture_capitalist:vc2, type: "Pre-Seed", investment: 99.00)



#my_super_business.pivot(domain: "health", name: "SUPER")
my_super_business.sign_contract(vc2, "angel", 200)


binding.pry
puts "end test"
0 #leave this here to ensure binding.pry isn't the last line