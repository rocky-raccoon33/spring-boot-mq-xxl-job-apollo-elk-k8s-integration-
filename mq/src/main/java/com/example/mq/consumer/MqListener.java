package com.example.mq.consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class MqListener {

    private static final Logger CUSTOM_LOGGER = LoggerFactory.getLogger("CUSTOM_LOGGER");

    @Autowired
    RabbitTemplate template;

    @Scheduled(fixedRate = 1000)
    public void receive() {
        String msg = (String) template.receiveAndConvert("test-queue");
        CUSTOM_LOGGER.info("Received: {} at {}", msg, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date()));
    }
}
