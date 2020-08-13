package main

import (
	"testing"
	"exer10"
)

func BenchmarkFibonacci1(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(1)
	}
}
func BenchmarkFibonacci5(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(5)
	}
}
func BenchmarkFibonacci10(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(10)
	}
}
func BenchmarkFibonacci20(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(20)
	}
}
func BenchmarkFibonacci25(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(25)
	}
}
func BenchmarkFibonacci30(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fibonacci(30)
	}
}



func BenchmarkFib30cutoff01(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,1)
	}
}
func BenchmarkFib30cutoff05(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,5)
	}
}
func BenchmarkFib30cutoff10(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,10)
	}
}
func BenchmarkFib30cutoff12(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,12)
	}
}
func BenchmarkFib30cutoff14(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,14)
	}
}
func BenchmarkFib30cutoff15(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,15)
	}
}
func BenchmarkFib30cutoff16(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,16)
	}
}
func BenchmarkFib30cutoff17(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,17)
	}
}
func BenchmarkFib30cutoff19(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,19)
	}
}
func BenchmarkFib30cutoff20(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,20)
	}
}
func BenchmarkFib30cutoff21(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,21)
	}
}
func BenchmarkFib30cutoff23(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,23)
	}
}
func BenchmarkFib30cutoff25(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,25)
	}
}
func BenchmarkFib30cutoff30(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.Fib(30,30)
	}
}

func BenchmarkFibMemoized(b *testing.B){
	for  n := 0; n < b.N; n++ {
		exer10.FibMemoized(30)
	}
}
