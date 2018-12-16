package main

import (
	"fmt"
	"kpi/labs/Lab8/parser"
)

func main() {
	var filename = "./test.xml"

	resp, err := parser.Xml2json(filename)
	if err != nil {
		fmt.Println(err.Error())
	}
	fmt.Println(resp)

	parsedXml := parser.ParseXml(filename)
	if err != nil {
		fmt.Println(err.Error())
	}

	fmt.Println(parsedXml.Candy[0])
	fmt.Println(parsedXml.Candy[1])
	fmt.Println(parsedXml.Candy[2])
}
