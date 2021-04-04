package main

import (
	"fmt"
	"log"
	"os/exec"
	"time"

	"periph.io/x/conn/v3/gpio"
	"periph.io/x/conn/v3/gpio/gpioreg"
	"periph.io/x/host/v3"
)

func main() {
	fmt.Println("start")
	// Load all the drivers:
	if _, err := host.Init(); err != nil {
		log.Fatal(err)
	}

	// Lookup a pin by its number:
	p := gpioreg.ByName("GPIO2")
	if p == nil {
		log.Fatal("Failed to find GPIO2")
	}

	fmt.Printf("%s: %s\n", p, p.Function())

	// Set it as input, with an internal pull down resistor:
	if err := p.In(gpio.PullDown, gpio.FallingEdge); err != nil {
		log.Fatal(err)
	}

	// Wait for edges as detected by the hardware, and print the value read:
	for {
		counter := 0
		p.WaitForEdge(-1)
	countLoop:
		for {
			switch p.Read() {
			case gpio.Low:
				counter++
				if counter >= 200 {
					fmt.Printf("shutdown start...\n")
					if err := exec.Command("shutdown", "-h", "now").Run(); err != nil {
						log.Fatal(err)
					}
				}
			default:
				break countLoop
			}
			time.Sleep(10 * time.Millisecond)
		}
	}
}
