class Rectangle

    attr_reader :a, :x, :y

    def initialize(a,x,y)
      @a = Float(a)
      @x = Float(x)
      @y = Float(y)
    end

    def overlap?(rect)
      false unless rect.is_a? Rectangle
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

  def overlap?
    raise NotImplementedError
  end

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
p rect[0].overlap?(rect[1])
