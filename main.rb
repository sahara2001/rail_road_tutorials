require 'gosu'
require_relative 'player'

=begin
Game window class inherits gosu::Window

=end
class WhackARuby < Gosu::Window
    WIDTH = 1600
    HEIGHT = 1600
    def initialize 
        super(WIDTH, HEIGHT)
        self.caption = 'What the hell?'
        #@image = Gosu::Image.new('image/rubi.png')
        @width = WIDTH
        @HEIGHT = HEIGHT
        
        @player = Player.new(self, 200,200)
        @players = []
        @players.insert(0,Player.new(self,500,500))

        
    end
    def get_players
        return @players
    end
    def draw 
        #@image.draw(@x - @width / 2, @y - @height / 2,  1)
        @player.draw
        for j in @players
            j.draw
        end
    end

    def update
        @player.turn_left if button_down?(Gosu::KbLeft)
        @player.turn_right if button_down?(Gosu::KbRight)
        @player.accelerate if button_down?(Gosu::KbUp)
        @player.move
    end

 


end


window = WhackARuby.new

window.show


