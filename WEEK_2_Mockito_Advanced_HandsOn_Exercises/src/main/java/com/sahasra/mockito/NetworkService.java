package com.sahasra.mockito;

public class NetworkService {
    private NetworkClient networkClient;

    public NetworkService(NetworkClient client) {
        this.networkClient = client;
    }

    public String connectToServer() {
        return "Connected to " + networkClient.connect();
    }
}
