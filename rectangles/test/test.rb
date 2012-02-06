require '../lib/rectangle.rb'
require 'test/unit'

class TestRectangles < Test::Unit::TestCase
  def test_init
    assert(ArgumentError) { Rectangle.new("a","b","c") }
    assert(ArgumentError) { Rectangle.new(-1, 1, 2) }
  end 

  def test_rect_a
    rect = Rectangle.new(0, 1, 2)
    assert(rect.a == 0.0)
    assert(rect.x1 == 1.0)
    assert(rect.y1 == 2.0)
    assert(rect.x2 == 1.0)
    assert(rect.y2 == 2.0)
  end

  def test_rect_b
    rect = Rectangle.new(4, 0, 0)
    assert(rect.a == 4.0)
    assert(rect.x1 == -2.0)
    assert(rect.y1 == -2.0)
    assert(rect.x2 == 2.0)
    assert(rect.y2 == 2.0)
  end

  def test_rect_c
    rect = Rectangle.new(2, 1, 2)
    assert(rect.a == 2.0)
    assert(rect.x1 == 0.0)
    assert(rect.y1 == 1.0)
    assert(rect.x2 == 2.0)
    assert(rect.y2 == 3.0)
  end

  def test_overlap
    r1 = Rectangle.new(4, 0, 0)
    r2 = Rectangle.new(2, 2, 0)

    assert(r1.overlap?("") == false)
    assert(r1.overlap?(r2) == true)
    assert(r2.overlap?(r1) == true)
    assert(r1.overlap?(nil) == false)
  end

  def test_area
    r1 = Rectangle.new(4, 0, 0)
    r2 = Rectangle.new(1, 0, 0)
    r3 = Rectangle.new(10, 0, 0)
    assert(r1.area == 16.0)
    assert(r2.area == 1.0)
    assert(r3.area == 100.0)
  end

  def test_overlap_area1
     r1 = Rectangle.new(4,0,0)
     r2 = Rectangle.new(2,2,2)

     assert(r1.overlap_area(r2) == 1)
     assert(r1.area + r2.area - r1.overlap_area(r2) == 19.0)
  end

  def test_overlap_area2
    r3 = Rectangle.new(4.0, 0.000, 0.000e-3)
    r4 = Rectangle.new(2.0e+0, -2, -2e0)
    assert(r3.area + r4.area - r3.overlap_area(r4) == 19.0)
  end

  def test_overlap_area3
    r5 = Rectangle.new(5.23, -10e20, 3e-2)
    r6 = Rectangle.new(4.345643225, +3e100, -1)

    assert(r5.overlap?(r6) == false)
    assert(r6.overlap?(r5) == false)
    
    assert(r6.overlap?(r6) == true)
    assert(r5.overlap?(r5) == true)

    assert(r5.overlap_area(r6) == 0)
    assert(r6.overlap_area(r5) == 0)
  end
end