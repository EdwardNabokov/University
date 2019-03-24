package consumer

import (
	"bytes"
	"github.com/streadway/amqp"
	"kpi/labs/Lab9/handlers"
	"log"
	"net/http"
)

func Consumer(channel *amqp.Channel, queue amqp.Queue) {
	msgs, err := channel.Consume(
		queue.Name,
		"",
		true,
		false,
		false,
		false,
		nil,
	)

	handlers.FailOnError(err)

	forever := make(chan bool)
	for d := range msgs {
		// Save to database TODO
		log.Printf("Received a message: %s", d.Body)
		log.Printf("Saving to database")
		resp, err := http.Post(
			"http://localhost:9200/xml/document/",
			"application/json",
			bytes.NewReader(d.Body),
		)
		log.Println(resp)
		handlers.FailOnError(err)

	}
	log.Printf(" [*] Waiting for messages")
	<-forever
}