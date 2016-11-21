package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Idea;
import com.infiniteideas.repository.IdeaRepository;
import com.infiniteideas.service.IdeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IdeaServiceImpl implements IdeaService {

    private IdeaRepository ideaRepository;

    @Autowired
    public IdeaServiceImpl(IdeaRepository ideaRepository) {
        this.ideaRepository = ideaRepository;
    }

    @Override
    public List<Idea> findAll() {
        return ideaRepository.findAll();
    }

    @Override
    public Idea findById(Long Id) {
        return ideaRepository.findOne(Id);
    }

    @Override
    public Idea save(Idea idea) {
       return ideaRepository.save(idea);
    }

    @Override
    public List<Idea> getRecommendations() {
        List<Idea> recommendations = ideaRepository.findAll();
        recommendations.stream()
                .limit(8)
                .sorted((idea1, idea2) -> idea2.getCollectedFunds().compareTo(idea1.getCollectedFunds()));

        return recommendations;
    }

    @Override
    public List<Idea> getUserIdeas(Long id) {
        return ideaRepository.findUserIdeas(id);
    }

}
