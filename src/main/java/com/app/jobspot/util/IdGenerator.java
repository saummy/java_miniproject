package com.app.jobspot.util;

import java.security.SecureRandom;
import java.time.Instant;

public class IdGenerator {

    private static final int JOB_ID_LENGTH = 5;

    private static String _generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        return sb.toString();
    }

    public static String generateJobId() {
        String base = _generateRandomString(JOB_ID_LENGTH);
        long timestamp = Instant.now().getEpochSecond();
        return "JS" + timestamp + base;
    }
}
