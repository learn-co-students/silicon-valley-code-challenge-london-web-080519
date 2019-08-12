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



#my_super_business.pivot(domain: "health", name: "SUPER")


binding.pry
puts "end test"
0 #leave this here to ensure binding.pry isn't the last line