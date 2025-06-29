package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class VerifyInteractionTest {
    @Test
    void shouldCallGetDataOnce() {
        ExternalApi api = mock(ExternalApi.class);
        when(api.getData()).thenReturn("x");
        new MyService(api).fetchData();

        verify(api, times(1)).getData();
    }
}
