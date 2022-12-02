package com.example.mq.consumer;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class BetaListener {

    @RabbitListener
    public void consume(Message message) {
        
    }
}
