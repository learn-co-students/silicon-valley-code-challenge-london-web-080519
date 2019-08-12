require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


startup1 = Startup.new(name: "freetrade", founder: "ben", domain: "fintech")
startup2 = Startup.new(name: "flatiron", founder: "avi", domain: "edtech")
startup3 = Startup.new(name: "tesla", founder: "elon", domain: "automotive")
startup4 = Startup.new(name: "facebook", founder: "mark", domain: "social")
startup5 = Startup.new(name: "nutmeg", founder: "nick", domain: "fintech")

venture_capitalist1 = VentureCapitalist.new(name: "jack", total_worth: 10000000000)
venture_capitalist2 = VentureCapitalist.new(name: "pete", total_worth: 500000000)
venture_capitalist3 = VentureCapitalist.new(name: "joe", total_worth: 1000000000)
venture_capitalist4 = VentureCapitalist.new(name: "manu", total_worth: 30000000000)
venture_capitalist5 = VentureCapitalist.new(name: "john", total_worth: 60000000)
venture_capitalist6 = VentureCapitalist.new(name: "mark", total_worth: 20000000000)

funding_round1 = FundingRound.new(startup: startup1, venture_capitalist: venture_capitalist1, type: "seed", investment: 500000)
funding_round2 = FundingRound.new(startup: startup2, venture_capitalist: venture_capitalist2, type: "series_a", investment: 400000)
funding_round3 = FundingRound.new(startup: startup3, venture_capitalist: venture_capitalist3, type: "series_b", investment: 700000)
funding_round4 = FundingRound.new(startup: startup4, venture_capitalist: venture_capitalist4, type: "series_c", investment: 800000)
funding_round5 = FundingRound.new(startup: startup5, venture_capitalist: venture_capitalist5, type: "seed", investment: 900000)
funding_round6 = FundingRound.new(startup: startup1, venture_capitalist: venture_capitalist6, type: "series_a", investment: 5000000)
funding_round7 = FundingRound.new(startup: startup2, venture_capitalist: venture_capitalist6, type: "series_b", investment: 20000)
funding_round8 = FundingRound.new(startup: startup2, venture_capitalist: venture_capitalist3, type: "seed", investment: 1500000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line