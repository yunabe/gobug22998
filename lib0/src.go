package lib0

import (
	"fmt"
)

type Person struct {
	Name string
}

func (p *Person) GetName() string {
	// Having dependency to fmt is important to reproduce the bug.
	return fmt.Sprintf("%q", p.Name)
}
