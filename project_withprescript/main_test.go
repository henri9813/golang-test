package main

import (
	"log"
	"os"
	"testing"
)

func TestMainFileExist(t *testing.T) {
	if _, err := os.Stat("myFile.txt"); err != nil {
		log.Fatal("PreScript was not run ( myFile.txt is missing )")
	}
}
