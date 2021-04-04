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
	if _, err := host.Init(); err != nil {
		log.Fatal(err)
	}

	p := gpioreg.ByName("GPIO2")
	if p == nil {
		log.Fatal("Failed to find GPIO2")
	}

	if err := p.In(gpio.PullDown, gpio.FallingEdge); err != nil {
		log.Fatal(err)
	}

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
