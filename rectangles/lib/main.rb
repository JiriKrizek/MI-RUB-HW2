require '../lib/rectangle.rb'
require '../lib/string.rb'

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