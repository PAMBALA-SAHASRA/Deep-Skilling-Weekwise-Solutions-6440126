package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class MyServiceTest {
    @Test
    void shouldReturnMockedValue() {
        ExternalApi api = mock(ExternalApi.class);
        when(api.getData()).thenReturn("mocked-value");

        MyService svc = new MyService(api);
        assertEquals("mocked-value", svc.fetchData());
    }
}
