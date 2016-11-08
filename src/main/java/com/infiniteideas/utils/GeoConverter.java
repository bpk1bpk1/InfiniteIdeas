package com.infiniteideas.utils;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class GeoConverter {
    private static final String GEO_CODE_SERVER = "http://maps.googleapis.com/maps/api/geocode/json?";

    public String[] getLocation(String code) {
        String address = buildUrl(code);
        String content = null;
        try {
            URL url = new URL(address);
            try (InputStream stream = url.openStream()) {
                int available = stream.available();
                byte[] bytes = new byte[available];
                stream.read(bytes);
                content = new String(bytes);
            }

            return parseLocation(content);
        }
        catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }

    private static String buildUrl(String code) {
        return GEO_CODE_SERVER +
                "address=" +
                code.replaceAll(" ", "+") +
                "&sensor=false";
    }

    private String[] parseLocation(String response) {
        // Look for location using brute force.
        // There are much nicer ways to do this, e.g. with Google's JSON library: Gson
        //     https://sites.google.com/site/gson/gson-user-guide

        String[] lines = response.split("\n");
        String lat = null;
        String lng = null;

        for (int i = 0; i < lines.length; i++) {
            if ("\"location\" : {".equals(lines[i].trim())) {
                lat = getOrdinate(lines[i+1]);
                lng = getOrdinate(lines[i+2]);
                break;
            }
        }

        return new String[] {lat, lng};
    }

    private String getOrdinate(String s) {
        String[] split = s.trim().split(" ");
        if (split.length < 1) {
            return null;
        }

        String ord = split[split.length - 1];
        if (ord.endsWith(",")) {
            ord = ord.substring(0, ord.length() - 1);
        }

        // Check that the result is a valid double
        Double.parseDouble(ord);

        return ord;
    }
}