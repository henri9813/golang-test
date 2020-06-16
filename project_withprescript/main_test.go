package main

import (
	"log"
	"os"
	"testing"
)

func TestMain(t *testing.M) {
	if _, err := os.Stat("myFile.txt"); err != nil {
		log.Fatal("PreScript was not run ( myFile.txt is missing )")
	}
}
