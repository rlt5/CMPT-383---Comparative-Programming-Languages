package exer10

import (
	"fmt"
	"image"
	"image/png"
	"os"
	"math"
)

func Norm(centerX int, centerY int, X int, Y int) float64 {
	return math.Sqrt(float64((centerX-X)*(centerX-X)+(centerY-Y)*(centerY-Y)))
}

func DrawCircle(outerRadius, innerRadius int, outputFile string) { 
	rect := image.Rectangle{image.Point{0,0},image.Point{200,200}}
	rgba := image.NewRGBA(rect)
	var center image.Point
	center.X = 100
	center.Y = 100

	for pixel_index := 0; pixel_index < len(rgba.Pix); pixel_index +=4 {

		x := (pixel_index/4) % 200
		y := (pixel_index/4) / 200
		r :=  Norm(center.X,center.Y,x,y)
		if r <= float64(outerRadius) && r >= float64(innerRadius) {
			rgba.Pix[pixel_index] 	= 0 // R
			rgba.Pix[pixel_index+1] = 0 // G
			rgba.Pix[pixel_index+2] = 0 // B
		} else {
			rgba.Pix[pixel_index] 	= 255 // R
			rgba.Pix[pixel_index+1] = 255 // G
			rgba.Pix[pixel_index+2] = 255 // B
		}
		rgba.Pix[pixel_index+3] = 255 // A
	}

	f, err := os.Create(outputFile); 
	if err != nil {
		fmt.Printf("outputFile: %v failed to create. Error: %v", outputFile, err)
		return
	}
	
	if err := png.Encode(f, rgba); err!=nil {
		fmt.Printf("Failed to encode. Error: %v", err)
		return 
	}
	
	if err := f.Close(); err != nil {
		fmt.Printf("Failed to Close. Error: %v", err)
		return
	}
	return
}