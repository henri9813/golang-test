package addition

import "testing"

func TestAddition(t *testing.T) {
	if Addition(5, 3) != 8 {
		t.Errorf("Oh ! 5 + 3 should be equal to 8 !")
	}
}
