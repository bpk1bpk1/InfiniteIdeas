package com.infiniteideas.repository;

import com.infiniteideas.model.UserPersonalDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserPersonalDetailsRepository extends JpaRepository<UserPersonalDetails, Long> {

    List<UserPersonalDetails> findAll();
}
