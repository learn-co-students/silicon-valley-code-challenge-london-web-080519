require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("Facebook", "Mark Zuckerberg", "www.facebook.com")
amazon = Startup.new("Amazon", "Jeff Bezos", "www.amazon.com")
microsoft = Startup.new("Microsoft", "Bill Gates", "www.microsoft.com")

abc = VentureCapitalist.new("ABC Capital", 20000000000)
xyz = VentureCapitalist.new("XYZ Capital", 1000000000)

funding1 = FundingRound.new(amazon, abc, "seed", 242)
funding2 = FundingRound.new(amazon, xyz, "seed", 400)
funding3 = FundingRound.new(microsoft, abc, "angel", 300)
funding4 = FundingRound.new(facebook, xyz, "series b", 100)
funding5 = FundingRound.new(amazon, xyz, "seed", 200)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line