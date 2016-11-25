package com.infiniteideas.repository;

import com.infiniteideas.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    @Query(value = ("select count(*) from login_master where selected_role=?1"), nativeQuery = true)
    Integer findEntrepreneurCount(String role);
}
