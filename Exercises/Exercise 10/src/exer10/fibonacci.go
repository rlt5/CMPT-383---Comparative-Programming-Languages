package exer10

func FibMemoized(n uint) uint {
	if n < 2 { return 1 }
	var result1 uint = 1
	var result2 uint = 1
	var i uint = 2
	var temp uint = 0
	for i <= n {
		temp = result2
		result2 = result1 + result2
		result1 = temp
		i++
	}
	return result2
}

// // OLD
// func Fib(n uint, cutoff uint) uint { 
// 	if n < 2 {return 1}
// 	if (n < cutoff) {return Fib(n-1,cutoff) + Fib(n-2,cutoff)}
// 	// if (n < cutoff) {return FibMemoized(n)}
// 	c := make(chan uint)
// 	go FibConcurrent(n,cutoff,c)
// 	v := <- c
// 	return v
// }

// func FibConcurrent(n uint, cutoff uint, c chan uint) {
// 	if n < 2 {
// 		c <- 1
// 		return
// 	}
// 	if (n < cutoff) {
// 		c <- Fib(n-1,cutoff) + Fib(n-2,cutoff)
// 		return
// 	}
// 	c1 := make(chan uint)
// 	c2 := make(chan uint)
// 	go FibConcurrent(n-1, cutoff, c1)
// 	go FibConcurrent(n-2, cutoff, c2)
// 	v := <- c1 + <- c2
// 	c <- v
// }


func Fib(n uint, cutoff uint) uint { 
	if n < 2 {return 1}
	if (n < cutoff) {return Fib(n-1,cutoff) + Fib(n-2,cutoff)}

	c := make(chan uint) 
	go func() {c <- Fib(n-1,cutoff)}()
	go func() {c <- Fib(n-2,cutoff)}()
	return <- c + <- c
}

func Fibonacci(n uint) uint {
	return Fib(n,19)
}

