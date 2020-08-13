package exer9

import (
	"fmt"
	"math"
)

// TODO: The Point struct, NewPoint function, .String and .Norm methods

// A Struct for Points
// In points.go, create a struct Point for two-dimensional points:  values. The struct should have two fields, x and y, both float64.

// Create a function NewPoint that creates a Point given x and y values: this would be a constructor in any other language, but in Go, it's just a function that returns a Point. [Note: we don't really need a constructor this simple and could use a Go struct literal instead, but we're creating the constructor anyway. There are, of course, cases where some work is required to construct a struct instance.]

type Point struct {
	x, y float64
}

func NewPoint(x float64, y float64) Point {
	return Point{x, y}
}

// String Representation
// There is a perfectly reasonable default string representation for structs in Go (which is used if you fmt.Print them), but we can make it nicer.

// Create a String() method on Point using fmt.Sprintf to output the usual parentheses-and-commas representation of a point:

// pt := NewPoint(3, 4.5)
// fmt.Println(pt) // should print (3, 4.5)
// fmt.Println(pt.String() == "(3, 4.5)") // should print true
// Hint: The %v format seems nice.

func (p Point) String() string {
	return fmt.Sprintf("(%v, %v)", p.x, p.y)
}

// Calculate Norm
// One more method to add: the Euclidean norm of the point: add up the squares of the components and take the square root.

// If everything is working, this should print true.

// pt := NewPoint(3, 4)
// fmt.Println(pt.Norm() == 5.0)
// Also, the provided tests should all pass.

func (p Point) Norm() float64 {
	return math.Sqrt((p.x * p.x) + (p.y * p.y))
}

// Scale Points
// Add a .Scale(f) method to the Point from last week. It should change an existing point in place and stretch it by a factor of f. For example:

// p := Point{1, 2}
// p.Scale(5)
// fmt.Println(p)
// … should print (5, 10).

func (p *Point) Scale(f float64) {
	p.x *= f
	p.y *= f
}

// Rotate
// We can add another transformation to a Point: rotation. We would like to call .Rotate(angle) and have the point rotated by angle radians around the origin. For angle , the transformation is:
// The result should be that this code:

// p := Point{1, 0}
// p.Rotate(math.Pi / 2)
// fmt.Println(p)
// p.Rotate(math.Pi / 2)
// fmt.Println(p)
// … should print (0, 1) and (-1, 0) (but probably not exactly due to floating-point error, but the results will be close to these values).

func (p *Point) Rotate(a float64) {
	x := p.x
	y := p.y
	p.x = x*math.Cos(a) - y*math.Sin(a)
	p.y = x*math.Sin(a) + y*math.Cos(a)
}
