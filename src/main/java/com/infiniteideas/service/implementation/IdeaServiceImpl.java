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
}
