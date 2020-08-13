package main

import (
	"testing"
	"exer10"
)


func BenchMark(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.FibMemoized(30)
	}
}
