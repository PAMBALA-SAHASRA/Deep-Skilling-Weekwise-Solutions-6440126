package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class MultipleReturnsTest {
    @Test
    void shouldReturnSequenceOfValues() {
        ExternalApi api = mock(ExternalApi.class);
        when(api.getData()).thenReturn("first").thenReturn("second");

        MyService svc = new MyService(api);
        assertEquals("first", svc.fetchData());
        assertEquals("second", svc.fetchData());
    }
}
