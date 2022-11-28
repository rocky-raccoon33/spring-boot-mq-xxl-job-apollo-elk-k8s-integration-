package com.example.core.db.repo;

import com.example.core.db.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query(value = "select * from user where name = ?1", nativeQuery = true)
    User findUserByName(String name);
}
