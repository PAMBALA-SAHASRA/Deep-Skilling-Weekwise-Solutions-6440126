package com.sahasra.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Exercise2_ParameterizedLogging {
    private static final Logger logger = LoggerFactory.getLogger(Exercise2_ParameterizedLogging.class);

    public static void main(String[] args) {
        String username = "Sahasra";
        int unreadMessages = 5;
        logger.info("User {} has {} unread messages", username, unreadMessages);
    }
}
