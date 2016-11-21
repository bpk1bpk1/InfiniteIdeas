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
}
