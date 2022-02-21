package main

import (
	"fmt"
	"os"
)

// tag::main[]
func main() {
	name := "World"     //<.>
	greeting := "Hello" //<.>

	// tag::env_check[]
	envGreeting, egFound := os.LookupEnv("HW_GREETING") //<.>
	envName, enFound := os.LookupEnv("HW_NAME")         //<.>
	// end::env_check[]

	// tag::arg_check[]
	agFound := len(os.Args) > 0
	anFound := len(os.Args) > 1
	// end::arg_check[]

	// tag::resolution[]
	if egFound {
		greeting = envGreeting
	}
	if enFound {
		name = envName
	}
	if !egFound && agFound { //<.>
		greeting = os.Args[0]
	}
	if !enFound && anFound { //<.>
		name = os.Args[1]
	}
	// end::resolution[]

	fmt.Printf("%s %s!", greeting, name) //<.>
}

// end::main[]
