package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Idea;
import com.infiniteideas.repository.IdeaRepository;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IdeaServiceImpl implements IdeaService {

    private IdeaRepository ideaRepository;
    private UserService userService;

    @Autowired
    public IdeaServiceImpl(IdeaRepository ideaRepository, UserService userService) {
        this.ideaRepository = ideaRepository;
        this.userService = userService;
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
    public Idea save(Idea idea, String name) {
        idea.setUserId(userService.findByUsername(name).getId());
        if (idea.getCollectedFunds() == null)
            idea.setCollectedFunds(0.0);
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

    @Override
    public void updateAndSave(Idea idea) {
        ideaRepository.update(idea.getId(), idea.getName(), idea.getDescription(), idea.getCategory(),
                idea.getSubCategory(), idea.getUserId(), idea.getFundsRequired(), idea.getCollectedFunds(),
                idea.getImage());
    }

    @Override
    public void processRefund(Long ideaId, Double funded) {
        Idea idea = ideaRepository.findOne(ideaId);
        idea.setCollectedFunds(idea.getCollectedFunds() - funded);
        ideaRepository.save(idea);
    }

}
