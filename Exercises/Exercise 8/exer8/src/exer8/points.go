package exer8

import (
	"fmt"
	"math"
)
// TODO: The Point struct, NewPoint function, .String and .Norm methods

// A Struct for Points
// In points.go, create a struct Point for two-dimensional points:  values. The struct should have two fields, x and y, both float64.

// Create a function NewPoint that creates a Point given x and y values: this would be a constructor in any other language, but in Go, it's just a function that returns a Point. [Note: we don't really need a constructor this simple and could use a Go struct literal instead, but we're creating the constructor anyway. There are, of course, cases where some work is required to construct a struct instance.]

type Point struct {
	x, y	float64
}

func NewPoint(x float64, y float64) Point {
	return Point{x,y}
}

// String Representation
// There is a perfectly reasonable default string representation for structs in Go (which is used if you fmt.Print them), but we can make it nicer.

// Create a String() method on Point using fmt.Sprintf to output the usual parentheses-and-commas representation of a point:

// pt := NewPoint(3, 4.5)
// fmt.Println(pt) // should print (3, 4.5)
// fmt.Println(pt.String() == "(3, 4.5)") // should print true
// Hint: The %v format seems nice.

func (p Point) String() string {
	return fmt.Sprintf("(%v, %v)",p.x, p.y);
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