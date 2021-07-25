package main

import (
	"log"
	"serial"
	"time"
	"fmt"
)

func main() {
	options := serial.RawOptions
	options.BitRate = 115200
	p, err := options.Open("COM10")
	if err != nil {
		log.Panic(err)
	}

	defer p.Close()

	fmt.Printf("RTS/CTS ==> 0")
	p.SetRTS(0)
	p.SetCTS(0)
	time.Sleep(1000 * time.Millisecond)
	fmt.Printf("RTS ==> 1")
	p.SetRTS(1)
	time.Sleep(1000 * time.Millisecond)
	fmt.Printf("CTS ==> 1")
	p.SetCTS(1)
}
