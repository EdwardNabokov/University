package parser

import (
	"bytes"
	"encoding/xml"
	"github.com/jbussdieker/golibxml"
	"github.com/krolaw/xsd"
	"io/ioutil"
	"strings"
	"unsafe"

	xj "github.com/basgys/goxml2json"
)

type Components struct {
	Protein float64 `xml:"protein"`
	Fat float64 `xml:"fat"`
	Carbs float64 `xml:"carbs"`
}

type Candy struct {
	Name string `xml:"name"`
	Energy float64 `xml:"energy"`
	Types []string `xml:"types>type"`
	Ingredients []string `xml:"ingredients>ingredient"`
	Consist Components `xml:"value"`
	Production string `xml:"production"`
}

type Candies struct {
	Candy []Candy `xml:"Candy"`
}

func Xml2json(filename string) (buffer *bytes.Buffer, err error) {
	respBytes, err := ioutil.ReadFile(filename)
	json, err := xj.Convert(strings.NewReader(string(respBytes)))
	if err != nil {
		panic("That's embarrassing...")
	}

	return json, nil
}

func ParseXml(filename string) Candies {
	respBytes, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}

	var candies Candies

	err = xml.Unmarshal(respBytes, &candies)
	if err != nil {
		panic(err)
	}

	return candies
}

func ValidateXmlWithXsd(filenameXml string, filenameXsd string) (status int64) {
	xsdBytes, err := ioutil.ReadFile(filenameXsd)
	if err != nil {
		panic(err)
	}

	xsdSchema, err := xsd.ParseSchema(xsdBytes)
	if err != nil {
		panic(err)
	}

	xsdBytes, err = ioutil.ReadFile(filenameXsd)
	if err != nil {
		panic(err)
	}

	xmlBytes, err := ioutil.ReadFile(filenameXml)
	if err != nil {
		panic(err)
	}

	doc := golibxml.ParseDoc(string(xmlBytes))
	if doc == nil {
		panic("Error parsed document")
	}

	defer doc.Free()

	if err := xsdSchema.Validate(xsd.DocPtr(unsafe.Pointer(doc.Ptr))); err != nil {
		panic(err)
	}

	return 1
}