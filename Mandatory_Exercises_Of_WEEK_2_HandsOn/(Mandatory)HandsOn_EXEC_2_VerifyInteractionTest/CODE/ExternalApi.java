package com.sahasra.mockito;

public interface ExternalApi {
    String getData();

    void saveData(String data);

    void firstCall();

    void secondCall();
}
