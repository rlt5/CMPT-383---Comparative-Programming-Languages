package exer10

import ( 
	"fmt"
)

type Triangle struct {
	A, B, C Point
}

func (t Triangle) String() string {
	return fmt.Sprintf("[%s %s %s]", t.A, t.B, t.C)
}

func (t* Triangle) Scale(a float64) {
	t.A.Scale(a)
	t.B.Scale(a)
	t.C.Scale(a)
}

func (t* Triangle) Rotate(a float64) {
	t.A.Rotate(a)
	t.B.Rotate(a)
	t.C.Rotate(a)
}

type Transformable interface {
	Scale(a float64)
	Rotate(a float64)
}

func TurnDouble(t Transformable, angle float64) { 
	t.Scale(2)
	t.Rotate(angle)
}
