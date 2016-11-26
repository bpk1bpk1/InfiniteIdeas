package com.infiniteideas.service;

import com.infiniteideas.model.Idea;
import java.util.List;

public interface IdeaService {

    List<Idea> findAll();

    Idea findById(Long id);

    Idea save(Idea idea, String name);

    List<Idea> getRecommendations();

    List<Idea> getUserIdeas(Long id);

    void updateAndSave(Idea idea);

    void processRefund(Long ideaId, Double funded);
}
