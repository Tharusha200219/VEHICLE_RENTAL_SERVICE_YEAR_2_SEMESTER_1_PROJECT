package java.util;
import java.io.FileInputStream;
import java.io.IOException;


public class Config {
    private static final Properties properties = new Properties();

    static {
        try {
            FileInputStream input = new FileInputStream("config.properties");
            properties.load(input);
            input.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}
