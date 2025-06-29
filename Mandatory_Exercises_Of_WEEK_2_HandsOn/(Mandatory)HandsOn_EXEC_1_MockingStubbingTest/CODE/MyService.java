package com.sahasra.mockito;

public class MyService {
    private final ExternalApi api;

    public MyService(ExternalApi api) {
        this.api = api;
    }

    public String fetchData() {
        return api.getData();
    }

    public void saveData(String data) {
        api.saveData(data);
    }

    public void first() {
        api.firstCall();
    }

    public void second() {
        api.secondCall();
    }
}
