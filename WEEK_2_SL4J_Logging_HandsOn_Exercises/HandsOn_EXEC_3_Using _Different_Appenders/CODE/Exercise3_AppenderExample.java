package com.sahasra.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Exercise3_AppenderExample {
    private static final Logger logger = LoggerFactory.getLogger(Exercise3_AppenderExample.class);

    public static void main(String[] args) {
        logger.info("This message should appear in both console and file.");
    }
}
