package com.sahasra.springtest;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
public class UserRepositoryCustomQueryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void testFindByName() {
        User user = new User();
        user.setId(200L);
        user.setName("Custom");

        userRepository.save(user);

        List<User> results = userRepository.findByName("Custom");
        assertEquals(1, results.size());
        assertEquals("Custom", results.get(0).getName());
    }
}
