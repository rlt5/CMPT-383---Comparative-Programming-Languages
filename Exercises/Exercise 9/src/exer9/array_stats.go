package exer9

import (
	"math"
	"math/rand"
	"time"
)

// Random Arrays
// We want to generate some random arrays. In array_stats.go, write a function that creates and returns an array with length integers and values from 0 to maxInt-1 with this signature:

// func RandomArray(length int, maxInt int) []int { … }
// When doing this, create a new random number generator that has a reasonable initial seed

func RandomArray(length int, maxInt int) []int {
	// TODO: create a new random generator with a decent seed; create an array with length values from 0 to values-1.
	rand.Seed(time.Now().UTC().UnixNano())
	time.Sleep( time.Nanosecond)
	var arr []int
	arr = make([]int, length, length)
	for i := 0; i < length; i++ {
		arr[i] = rand.Intn(maxInt)
	}
	return arr
}


// Array Summary Stats
// We want to calculate the mean and standard deviation of values in an array/slice. For arrays with values  and  elements, we will use these formulas:

// In order to calculate these, we need the length of the slice (easy),  and . Those are things we can calculate in parallel on a large array.

// We will break the array into some evenly-sized slices and want to calculate the two sums on each of the chunks concurrently in goroutines. Our function will take the array/slice and number of chunks to break the array into:

// func MeanStddev(arr []int, chunks int) (mean, stddev float64) { … }
// You can assume that the length of arr is divisible by chunks: no rounding error to worry about.

// In order to do this, you need to create:

// A struct to hold partial sums as they are generated.
// A channel to communicate these partial sums back to the MeanStddev function.
// A function that can run in a goroutine, calculate the sum and sum of squares on a slice, and send the values back along the channel.
// In MeanStddev, you will need to create chunks goroutines to calculate partial sums. Then receive chunks values from the channel, create the final sums, and return the correct values.

func GenerateSum(arr []int, results chan int){
	sum := 0
	for i := 0; i < len(arr) ; i++ {
		sum += arr[i]
	}
	results <- sum
}

func GenerateSumSquares(arr []int, results chan int){
	sum := 0
	for i := 0; i < len(arr) ; i++ {
		sum += arr[i] * arr[i]
	}
	results <- sum
}

type Stats struct {
	partialSums, partialSumsSquared chan int
}

func MeanStddev(arr []int, chunks int) (mean, stddev float64) {
// func MeanStddev(arr []int, chunks int) (mean float64) {
	n := len(arr)
	if n % chunks != 0 {
		panic("You promised that chunks would divide slice size!")
	}

	stats := Stats{make(chan int, chunks), make(chan int, chunks)}

	// chunk := make([]int, chunks)
	chunkSize := n / chunks
	for i := 0; i < chunks; i++ {
		go GenerateSum(arr[i*chunkSize:i*chunkSize + chunkSize], stats.partialSums)
		go GenerateSumSquares(arr[i*chunkSize:i*chunkSize + chunkSize], stats.partialSumsSquared)
	}
	
	sum := 0;
	sumSquared := 0;

	for i := 0; i < chunks*2; i++ {
		select {
		case sumChunks := <- stats.partialSums:
			sum += sumChunks
		case sumSquaredChunks := <- stats.partialSumsSquared:
			sumSquared += sumSquaredChunks
		}	
	}
	mean = float64(sum) / float64(n)
	stddev = math.Sqrt(float64(sumSquared) / float64(n) - mean * mean)

	return mean, stddev
	// TODO: calculate the mean and population standard deviation of the array, breaking the array into chunks segments
	// and calculating on them in parallel.

}
