package com.infiniteideas.repository;

import com.infiniteideas.model.Idea;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IdeaRepository extends JpaRepository<Idea, Long> {
    List<Idea> findAll();

    Idea findOne(Long id);

    Idea save(Idea idea);

    @Query(value = ("SELECT * FROM IDEA WHERE USER_ID = ?1"), nativeQuery = true)
    List<Idea> findUserIdeas(Long id);

    @Query(value = ("UPDATE IDEA SET name = ?2, description = ?3, category = ?4, sub_category = ?5, user_id = ?6, " +
            "funds_required = ?7, collected_funds = ?8, image = ?9 WHERE id = ?1"), nativeQuery = true)
    void update(Long id, String name, String description, String category, String subCategory, Long userId,
                Double fundsRequired, Double collectedFunds, String image);
}
