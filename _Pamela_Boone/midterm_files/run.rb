# require_relative 'person'
# require_relative 'category'
# require_relative 'mashable4'

  @stories = []

require 'rest-client'
require 'json' 

  def get_from_mashable
      mash = JSON.load(RestClient.get('http://mashable.com/stories.json'))
      mash["new"].map do |story|
        attributes = {title: story["title"], author: story["author"], link: story["link"], channel: story["channel"]} 
        @stories << attributes
        @stories
        # attributes
      end

  end

  def show_channel_stories(stories_mash)
    #lists articles on Mashable based on selected channel -- need IF statement
    @stories.map do |story| 
        channel = story[:channel]
        title = story[:title]
        if channel.include? "Watercooler"
        # @category
        # if @category == story["channel"]
          # puts "THE LATEST NEWS ON MASHABLE:\n Story: #{story[:title]}, Author: #{story[:author]}, URL: #{story[:link]}, Category: #{story[:channel]}"
          puts title, channel
        end
    end
  end
stories_mash = get_from_mashable

show_channel_stories stories_mash

class Run

  def initialize
    # @person = person
    @channel = "Watercooler"
    @guesses = 2
    # @stories = []
  end

  def play
    puts "Enter 'Watercooler' to see all new Watercooler stories on Mashable"
    @guesses.times do |x|  #Change x to guesses? - P.B.
      # players_guess = $stdin.gets.chomp.to_i
       players_guess = gets.strip
      return if correct?(players_guess)
      guesses_left = @guesses -= 1 #Find a way to decrement guesses_left each time through the loop.
      puts "\nYou have #{guesses_left} guesses left!"
    end
    puts "You lost! :-( The number to guess was #{@channel}."
  end

  def correct?(players_guess)
    @stories.map do |story| 
      if players_guess == @channel
        puts "You win! The number was #{@channel}."
        puts title, channel
        # show_channel_stories stories_mash
        # puts "MASHABLE NEWS: Story: #{story2[:title]}, Category: #{story2[:category]}, Written By: #{story2[:author]}"
         # puts "MASHABLE NEWS: Story: #{story2[:title]}"
        return true
      elsif players_guess < @channel
        puts "Make your next guess higher than #{players_guess}"
      elsif players_guess > @channel
        puts "Make your next guess lower than #{players_guess}"
      end
      false
    end
  end


end