package main

import (
	"github.com/ajstarks/svgo"
	"os"
)

func main() {
	width := 500
	height := 500
	canvas := svg.New(os.Stdout)
	canvas.Start(width, height)
	canvas.Circle(width/2, height/2, 100, "fill:none; stroke:black")
	canvas.Text(255, 315, "λ", "text-anchor:middle;font-size:200px;fill:black")
	canvas.End()
}
