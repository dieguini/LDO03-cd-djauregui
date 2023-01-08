package com.h2.h2api.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages = "com.h2.h2api.repositorios")
public class PersistenceConfig {
  
}
