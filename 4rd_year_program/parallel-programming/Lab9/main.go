package main

import (
	"fmt"
	"github.com/streadway/amqp"
	"kpi/labs/Lab9/consumer"
	"kpi/labs/Lab9/handlers"
	"kpi/labs/Lab9/parser"
	"sync"
)


func main() {
	conn, channel := handlers.ConnectToQueue("amqp://admin:admin@localhost:5672/")
	defer channel.Close()
	defer conn.Close()

	q, err := channel.QueueDeclare(
		handlers.QUEUENAME,
		false,
		false,
		false,
		false,
		nil,
	)
	handlers.FailOnError(err)

	publisher(channel, q)

	var wg sync.WaitGroup
	wg.Add(1)
	go consumer.Consumer(channel, q)

	wg.Wait()
}

func publisher(channel *amqp.Channel, q amqp.Queue) {
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