class Rectangle
    attr_reader :a, :x1, :x2, :y1, :y2

    def initialize(a,x,y)
      @a = Float(a)
      @x1 = Float(x)-(@a/2)
      @y1 = Float(y)-(@a/2)
      @x2 = x1+@a
      @y2 = y1+@a
    end

    def overlap?(rect)
      return false unless rect.is_a? Rectangle

      return (@x1 <= rect.x2 && 
              @x2 >= rect.x1 && 
              @y1 <= rect.y2 && 
              @y2 >= rect.y1)
    end
end

class String
  def is_number?
    true if Float(self) rescue false
  end

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

  def input
    r1 = inputRect("prvniho")
    r2 = inputRect("druheho")
    [r1, r2]
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
#    print "Obsah sjednoceni dvou ctvercu je ."
  end

  def input_error
    puts INPUT_ERROR
    exit
  end
end

m = Main.new
Array rect = m.input
r1=rect[0]
r2=rect[1]

if !r1.overlap?(r2)
  print "Ctverce se ani nedotykaji."
  exit
end

p r2
p r1
x_overlap = ([r2.x2,r1.x2].min) - ([r2.x1, r1.x1].max)
p x_overlap
y_overlap = ([r2.y2,r1.y2].min) - ([r2.y1, r1.y1].max)
p y_overlap
overlap = x_overlap * y_overlap
p overlap

sum = r1.a*r1.a + r2.a*r2.a - overlap
p sum
