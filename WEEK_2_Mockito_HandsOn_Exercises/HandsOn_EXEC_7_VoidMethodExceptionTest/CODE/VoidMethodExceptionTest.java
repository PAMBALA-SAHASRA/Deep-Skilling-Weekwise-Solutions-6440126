package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class VoidMethodExceptionTest {
    @Test
    void shouldThrowExceptionWhenSavingFail() {
        ExternalApi api = mock(ExternalApi.class);
        doThrow(new RuntimeException("fail")).when(api).saveData("fail");

        MyService svc = new MyService(api);
        assertThrows(RuntimeException.class, () -> svc.saveData("fail"));
    }
}
