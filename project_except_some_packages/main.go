package main

import (
	"log"
	"project/pkg/addition"
)

func main() {
	log.Print("This project is awesome !")

	log.Print(addition.Addition(1, 5))
}
