package main

import (
	"kpi/labs/Lab9/consumer"
	"kpi/labs/Lab9/handlers"
	"kpi/labs/Lab9/publisher"
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

	publisher.Publisher(channel, q)

	var wg sync.WaitGroup
	wg.Add(1)
	go consumer.Consumer(channel, q)

	wg.Wait()
}
