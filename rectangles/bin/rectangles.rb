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

class String
  # Returns true if string contains number
  def is_number?
    true if Float(self) rescue false
  end

  # Returns true if string contains non negative number
  def is_non_negative_number?
    if is_number? and Float(self)>=0
      true
    else
      false
    end
  end
end

class Main
  INPUT_ERROR="Spatny vstup."

  def run
    r1 = inputRect("prvniho")
    r2 = inputRect("druheho")

    if !r1.overlap?(r2)
      print "Ctverce se ani nedotykaji."
      exit
    end

    overlap_area = r1.overlap_area(r2)

    sum_area = r1.area + r2.area - overlap_area

    print "Obsah sjednoceni dvou ctvercu je #{sum_area}."
  end

private
  def inputRect(text)
  	print "Zadejte delku hrany #{text} ctverce: "
    a = gets
    input_error unless a.is_non_negative_number?

    print "Zadejte x-ovou souradnici stredu #{text} ctverce: "
    x = gets
    input_error unless x.is_number?

    print "Zadejte y-ovou souradnici stredu #{text} ctverce: "
    y = gets
    input_error unless y.is_number?

    rect = Rectangle.new(a,x,y)
  end

  def input_error
    puts INPUT_ERROR
    exit
  end
end

m = Main.new
m.run