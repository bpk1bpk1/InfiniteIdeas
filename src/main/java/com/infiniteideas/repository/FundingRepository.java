package com.infiniteideas.repository;

import com.infiniteideas.model.Funding;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FundingRepository extends JpaRepository<Funding, Long> {

    @Query(value = ("SELECT * FROM FUNDING WHERE USER_ID = ?1"), nativeQuery = true)
    List<Funding> getUserTransactions(Long userId);

    @Query(value = ("SELECT SUM(funded) FROM FUNDING;"), nativeQuery = true)
    Integer getRevenue();
}
