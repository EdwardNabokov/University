package publisher

import (
	"fmt"
	"github.com/streadway/amqp"
	"kpi/labs/Lab9/handlers"
	"kpi/labs/Lab9/parser"
)

func Publisher(channel *amqp.Channel, q amqp.Queue) {
	var filename = "./test.xml"
	if status := parser.ValidateXmlWithXsd(filename, "./test.xsd"); status != 1 {
		fmt.Println("XML is not correct!")
		return
	}

	json, err := parser.Xml2json(filename)
	err = handlers.PublishMsg(
		json.Bytes(),
		"application/json",
		channel,
		q,
	)
	handlers.FailOnError(err)
}
