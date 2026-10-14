package com.crms.config;

import com.crms.entity.User;
import com.crms.enums.Role;
import com.crms.repository.UserRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class BootstrapAdminConfig {
    @Bean
    CommandLineRunner bootstrapAdmin(
            UserRepository users,
            PasswordEncoder encoder,
            @Value("${crms.bootstrap.admin-email:}") String email,
            @Value("${crms.bootstrap.admin-password:}") String password) {
        return args -> {
            if (email == null || email.isBlank() || password == null || password.isBlank()) return;
            if (users.findByEmailIgnoreCase(email).isPresent()) return;
            var admin = new User();
            admin.setName("System Administrator");
            admin.setEmail(email.trim());
            admin.setPassword(encoder.encode(password));
            admin.setRole(Role.ADMIN);
            users.save(admin);
        };
    }
}
