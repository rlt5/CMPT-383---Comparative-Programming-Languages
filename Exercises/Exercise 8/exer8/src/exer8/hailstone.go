package exer8

// TODO: your Hailstone, HailstoneSequenceAppend, HailstoneSequenceAllocate functions

// ============== RESULTS ==============
// goos: linux
// goarch: amd64
// pkg: exer8
// BenchmarkHailSeqAppend-12         500000              2039 ns/op
// BenchmarkHailSeqAllocate-12      1000000              1189 ns/op
// PASS
// ok      exer8   2.258s


func Hailstone(n uint) uint {
	if n % 2 == 0 {
		return n / 2
	} else {
		return 3 * n + 1
	}
}
func HailstoneSequenceAppend(n uint) []uint {
	var intSlice []uint;
	for n != 1 {
		intSlice = append(intSlice,n)
		n = Hailstone(n)
	}
	intSlice = append(intSlice,1)
	return intSlice
}


func HailstoneSequenceAllocate(n uint) []uint {
	length := HailstoneLength(n);
	intSlice := make([]uint,length);
	for i := uint(0); i < length; i++ {
		intSlice[i] = n
		n = Hailstone(n)
	}
	return intSlice;
}

func HailstoneLength(n uint) uint {
	var length uint = 1;
	for n != 1 {
		length++
		n = Hailstone(n)
	}
	return length
}