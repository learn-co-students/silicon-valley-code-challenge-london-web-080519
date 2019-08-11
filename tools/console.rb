require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new(name: "Facebook", founder:"Mark Z", domain:"Social Media")
twitter = Startup.new(name: "Twitter", founder:"Mr Twitter", domain:"Social Media")
simba = Startup.new(name: "Simba", founder:"Mr Simba", domain:"Home Furnitures")

venture1 = VentureCapitalist.new(name: "venture1")
venture2 = VentureCapitalist.new(name: "venture2")
venture3 = VentureCapitalist.new(name: "venture3")
venture4 = VentureCapitalist.new(name: "venture4")

funding1 = FundingRound.new(startup: facebook, venture_capitalist: venture1, type:"Seed", investment:200000000)
funding2 = FundingRound.new(startup: facebook, venture_capitalist: venture2, type:"Seed", investment:250000000)
funding3 = FundingRound.new(startup: twitter, venture_capitalist: venture2, type:"Series A", investment:800000000)
funding4 = FundingRound.new(startup: twitter, venture_capitalist: venture2, type:"Series B", investment:200000)
funding5 = FundingRound.new(startup: simba, venture_capitalist: venture2, type:"Series B", investment:9000)
funding6 = FundingRound.new(startup: facebook, venture_capitalist: venture2, type:"Seed", investment:250000000)
funding7 = FundingRound.new(startup: simba, venture_capitalist: venture4, type:"Series B", investment:9000000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line