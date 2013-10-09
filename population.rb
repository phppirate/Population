require_relative 'lib/setup'
require_relative 'lib/analytics'

class Population
  attr_accessor :analytics, :numt

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
    @numt = 1
  end
  
  def menu
    system 'clear'
    print("
            
       ____        
       |   |                  |               
       |___|  __   ___        |     ___  __|__ -  __  |___                                      
       |     /  | |   | |  |  |    |   |   |   | /  | |   |
       |     |__/ |___| |__|_ |___ |___|_  |   | |__/ |   |
                  |                            
                  |
           
    ")
    
    @numt += 1
    print "Population Menu\n".upcase
    print "-" * 15
    @analytics.options.each do |opt|
      print "\n#{opt[:menu_id]}. #{opt[:menu_title]}"
    end
    print "\n"
    print "-" * 15
    print "\n"
  end
  
  def run
    stop = false

    while stop != :exit do
      self.menu
      print "\nChoice: "
      choice = gets.strip.to_i
      print "\n"
      stop = @analytics.run(choice)
      if stop == :exit
        puts "\n\n<< Goodbye see you later >>\n\n"
      else
        print "\n\nHit Enter".upcase
        gets
      end
    end
  end
end
p = Population.new
p.run