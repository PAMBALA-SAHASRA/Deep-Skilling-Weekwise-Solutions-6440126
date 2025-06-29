package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class ArgumentMatchingTest {
    @Test
    void shouldAcceptAnyArgument() {
        ExternalApi api = mock(ExternalApi.class);
        when(api.getData()).thenReturn("ok");

        new MyService(api).fetchData();

        verify(api).getData();
    }

}
