package handlers

import (
	"fmt"
	"github.com/streadway/amqp"
)

const (
	QUEUENAME = "xml-changer"
	QUEUETOPIC = "xml_topic"
)

func FailOnError(err error) {
	if err != nil {
		fmt.Println(err.Error())
	}
}

func ConnectToQueue(hostname string) (*amqp.Connection, *amqp.Channel) {
	conn, err := amqp.Dial(hostname)
	FailOnError(err)

	ch, err := conn.Channel()
	FailOnError(err)

	return conn, ch
}

func PublishMsg(body []byte, contentType string, channel *amqp.Channel, queue amqp.Queue) error {
	return channel.Publish(
		"",
		queue.Name,
		false,
		false,
		amqp.Publishing {
			ContentType: contentType,
			Body:        body,
		})
}
