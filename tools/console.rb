require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new(name: 'Springg', founder: 'Big Boss', domain: 'springg.com')
s2 = Startup.new(name: 'IronFlat', founder: 'Iva', domain: 'ironisflat.com')
s3 = Startup.new(name: 'Gemly', founder: 'Jack Ruby', domain: 'gmly.com')
s4 = Startup.new(name: 'Myners', founder: 'Jack Ruby', domain: 'myners.com')

vc1 = VentureCapitalist.new(name: "Mickey Moneybags", total_worth: 3000000000000)
vc2 = VentureCapitalist.new(name: "Humble Harry", total_worth: 43000000)
vc3 = VentureCapitalist.new(name: "Scrooge", total_worth: 32200000000)


fr1 = FundingRound.new(startup: s1, venture_capitalist: vc1, type: "Angel", investment: 500000.00)
fr2 = FundingRound.new(startup: s2, venture_capitalist: vc2, type: "Pre Seed", investment: 23000.32)
fr3 = FundingRound.new(startup: s3, venture_capitalist: vc1, type: "Series 1", investment: 3000.66)
fr4 = FundingRound.new(startup: s4, venture_capitalist: vc2, type: "Series 1", investment: 609000.00)

fr5 = s2.sign_contract(venture_capitalist: vc1, type: "Pre Seed", investment: 78390.33)
fr6 = s2.sign_contract(venture_capitalist: vc1, type: "Seed", investment: 78390.33)
fr7 = s2.sign_contract(venture_capitalist: vc3, type: "Seed", investment: 3222222.33)

fr8 = vc3.offer_contract(startup: s4, type: 'Series B', investment: 65744.00)
fr9 = vc3.offer_contract(startup: s1, type: 'Series A', investment: 65744.00)





binding.pry
0 #leave this here to ensure binding.pry isn't the last line