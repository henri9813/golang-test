package substration

import "testing"

func TestSubstraction(t *testing.T) {
	if substraction(5, 3) != 2 {
		t.Errorf("Oh ! 5 - 3 should be equal to 2 !")
	}
}
