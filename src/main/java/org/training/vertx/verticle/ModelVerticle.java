package org.training.vertx.verticle;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.eventbus.EventBus;
import org.training.vertx.comman.Endpoint;

import java.util.logging.Logger;

/**
 * @author Anton Lenok <AILenok.SBT@sberbank.ru>
 * @since 26.04.17.
 * Verticle который символизирует фундаментальные вычисления с моделью данных
 */
public class ModelVerticle extends AbstractVerticle {

    private final static Logger LOGGER = Logger.getLogger(ModelVerticle.class.getName());

    private EventBus eventBus;

    @Override
    public void start() {
        eventBus = vertx.eventBus();

        eventBus.consumer(Endpoint.EB_BROADCAST, message -> {
            LOGGER.info("Model catch request for timestamp: " + message.body());
            String response = String.valueOf(System.currentTimeMillis());
            LOGGER.info("Timestamp generated: " + response);
            message.reply(response);
            LOGGER.info("Success replied with generated timestamp: " + response);
        });

        LOGGER.info("Model verticle started!");
    }
}
