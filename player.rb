require 'gosu'


class Player
    def initialize(window, pos_x, pos_y)
        class << self; attr_accessor :y  end
        class << self; attr_accessor :x  end
        class << self; attr_accessor :radius  end
        @x = pos_x
        @y = pos_y
        @angle = 0
        @image = Gosu::Image.new('image/player.png')
        @radius = 100
        
        @velocity_x = 0
        @velocity_y = 0


        @window = window

        @ROTATION_SPEED = 3
        @ACCELERATION = 2
        @FRICTION = 0.9


    end

    def draw
        @image.draw_rot(@x,@y,1,@angle)
    end

    def turn_right
        @angle += @ROTATION_SPEED
    end
    def turn_left
        @angle -= @ROTATION_SPEED
    end
    def accelerate
        @velocity_x += Gosu.offset_x(@angle,@ACCELERATION)
        @velocity_y += Gosu.offset_y(@angle,@ACCELERATION)
    end
    def deaccelerate
        @velocity_x -= Gosu.offset_x(@angle,@ACCELERATION)
        @velocity_y -= Gosu.offset_y(@angle,@ACCELERATION)
    end

    def move
        @x += @velocity_x
        @y += @velocity_y
        @velocity_x *= @FRICTION
        @velocity_y *= @FRICTION

        # create walls
        if @x > @window.width - @radius
            @velocity_x = 0
            @x = @window.width - @radius
        end
        if @x < @radius
            @velocity_x = 0
            @x = @radius
        end
        if @y > @window.height - @radius
            @velocity_y = 0
            @y = @window.height - @radius
        end
        if @y < @radius
            @velocity_y = 0
            @y =  @radius
        end

        #check distance to other players
        players = @window.get_players
        for i in players
            if @y > i.y-@radius - i.radius && @y < i.y+@radius + i.radius &&  @x > i.x-@radius - i.radius && @x < i.x+@radius + i.radius
                @velocity_y = 0- @velocity_y
                @velocity_x = 0- @velocity_x
            
            end
=begin
            if @y < i.y+@radius + i.radius
                @velocity_y = 0
                @y = i.y + @radius + i.radius
            end

            if @x > i.x-@radius - i.radius
                @velocitx_x = 0
                @x = i.x-@radius - i.radius
            end
            if @x < i.x+@radius + i.radius
                @velocitx_x = 0
                @x = i.x+@radius + i.radius
=end
        end
    end

end
