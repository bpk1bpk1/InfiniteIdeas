package com.infiniteideas.repository;

import com.infiniteideas.model.Funding;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundingRepository extends JpaRepository<Funding, Long> {

}
