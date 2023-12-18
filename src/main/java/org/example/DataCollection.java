package org.example;

import java.util.HashMap;

public class DataCollection {
    private HashMap<String, String> collection;

    public DataCollection() {
        collection = new HashMap<>();
        // Добавление данных в коллекцию для примера
        collection.put("key1", "value1");
        collection.put("key2", "value2");
        collection.put("key3", "value3");
        collection.put("key4", "value4");
        collection.put("key5", "value5");
        collection.put("key6", "value6");
    }

    public String searchByKey(String key) {
        return collection.get(key);
    }

    public void replaceValue(String key, String newValue) {
        collection.replace(key, newValue);
    }
}
