package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class VoidMethodInvocationTest {
    @Test
    void shouldInvokeSaveData() {
        ExternalApi api = mock(ExternalApi.class);
        doNothing().when(api).saveData("hello");

        new MyService(api).saveData("hello");

        verify(api).saveData("hello");
    }
}
