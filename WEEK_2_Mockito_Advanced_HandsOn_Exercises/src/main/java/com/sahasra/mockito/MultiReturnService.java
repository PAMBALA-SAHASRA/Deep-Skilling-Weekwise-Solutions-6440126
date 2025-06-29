package com.sahasra.mockito;

public class MultiReturnService {
    private Repository repository;

    public MultiReturnService(Repository repository) {
        this.repository = repository;
    }

    public String processData() {
        return "Processed " + repository.getData();
    }
}
