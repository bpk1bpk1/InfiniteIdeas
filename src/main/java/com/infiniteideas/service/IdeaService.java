package com.infiniteideas.service;

import com.infiniteideas.model.Idea;
import java.util.List;

public interface IdeaService {

    List<Idea> findAll();

    Idea findById(Long id);

    Idea save(Idea idea);

    List<Idea> getRecommendations();
}
