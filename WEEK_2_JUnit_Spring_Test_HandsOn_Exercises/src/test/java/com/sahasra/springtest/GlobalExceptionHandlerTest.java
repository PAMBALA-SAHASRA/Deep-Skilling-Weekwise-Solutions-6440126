package com.sahasra.springtest;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.NoSuchElementException;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@WebMvcTest(UserController.class)
public class GlobalExceptionHandlerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    @Test
    void testNotFoundExceptionHandled() throws Exception {
        when(userService.getUserById(999L)).thenThrow(new NoSuchElementException());

        mockMvc.perform(MockMvcRequestBuilders.get("/users/999"))
                .andExpect(status().isNotFound())
                .andExpect(content().string("User not found"));
    }
}
