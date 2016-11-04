package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.Idea;
import com.infiniteideas.model.User;
import com.infiniteideas.repository.FundingRepository;
import com.infiniteideas.service.HistoryService;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HistoryServiceImpl implements HistoryService{

    private FundingRepository fundingRepository;
    private UserService userService;
    private IdeaService ideaService;

    @Autowired
    public HistoryServiceImpl(FundingRepository fundingRepository, UserService userService, IdeaService ideaService) {
        this.fundingRepository = fundingRepository;
        this.userService = userService;
        this.ideaService = ideaService;
    }


    @Override
    public Map<Funding, Idea> findAllTransactions(String name) {
        User user = userService.findByUsername(name);
        return getUserIdeas(fundingRepository.getUserTransactions(user.getId()));
    }

    @Override
    public Map<Funding, Idea> getUserIdeas(List<Funding> fundHistory) {
        Map<Funding, Idea> fundingIdeaMap = new HashMap<>();
        fundHistory.forEach(s -> {
            Idea idea = ideaService.findById(s.getIdeaId());
            fundingIdeaMap.put(s, idea);
        });
        return fundingIdeaMap;
    }
}
