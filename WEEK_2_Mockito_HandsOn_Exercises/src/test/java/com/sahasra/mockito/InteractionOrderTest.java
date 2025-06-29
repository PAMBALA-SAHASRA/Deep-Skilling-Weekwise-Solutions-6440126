package com.sahasra.mockito;

import com.sahasra.mockito.ExternalApi;
import com.sahasra.mockito.MyService;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;
import static org.mockito.Mockito.*;

public class InteractionOrderTest {
    @Test
    void shouldCallMethodsInOrder() {
        ExternalApi api = mock(ExternalApi.class);
        MyService svc = new MyService(api);

        svc.first();
        svc.second();

        InOrder inOrder = inOrder(api);
        inOrder.verify(api).firstCall();
        inOrder.verify(api).secondCall();
    }
}
