package addition

import "testing"

func TestAddition(t *testing.T) {
	if addition(5,3) != 2 {
		t.Errorf("Oh ! 5 - 3 should be equal to 2 !")
	}
}
