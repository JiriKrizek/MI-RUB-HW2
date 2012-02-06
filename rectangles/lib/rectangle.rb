class Rectangle
    attr_reader :a, :x1, :x2, :y1, :y2

    # Initialize new rectangle with given values
    def initialize(a,x,y)
      @a = Float(a)
      @x1 = Float(x)-(@a/2)
      @y1 = Float(y)-(@a/2)
      @x2 = x1+@a
      @y2 = y1+@a
    end

    # Returns true if rectangles are intersected (or at least touch by one corner)
    def overlap?(rect)
      return false unless rect.is_a? Rectangle

      return (@x1 <= rect.x2 && 
              @x2 >= rect.x1 && 
              @y1 <= rect.y2 && 
              @y2 >= rect.y1)
    end

    # Returns rectangle area
    def area
      @a*@a
    end

    # Returns only overlap area 
    def overlap_area(rect)
      if !overlap?(rect)
        return 0
      end

      x_overlap = ([rect.x2,@x2].min) - ([rect.x1, @x1].max)
      y_overlap = ([rect.y2,@y2].min) - ([rect.y1, @y1].max)
      overlap = x_overlap * y_overlap
    end
end