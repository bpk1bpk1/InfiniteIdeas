package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.Idea;
import com.infiniteideas.model.ShoppingCartItem;
import com.infiniteideas.repository.FundingRepository;
import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CheckoutServiceImpl implements CheckoutService {

    private FundingRepository fundingRepository;
    private IdeaService ideaService;
    private UserService userService;

    @Autowired
    public CheckoutServiceImpl(FundingRepository fundingRepository, IdeaService ideaService, UserService userService) {
        this.fundingRepository = fundingRepository;
        this.ideaService = ideaService;
        this.userService = userService;
    }


    @Override
    public void makeTransactions(Map<String, ShoppingCartItem> itemMap, String userName) {
        List<Funding> fundingList = new ArrayList<>();
        Long userId = userService.findByUsername(userName).getId();

        itemMap.forEach((key, value) -> {
            Funding funding = new Funding();
            funding.setUserId(userId);
            funding.setIdeaId(value.getId());
            funding.setFunded(value.getFunds());
            fundingList.add(funding);
        });

        List<Funding> validation = save(fundingList);
        if (validation.size() == fundingList.size()){
            makeIdeaUpdate(validation, userName);
        }

    }

    private void makeIdeaUpdate(List<Funding> validation, String userName) {
        validation.forEach(s -> {
            Idea idea = ideaService.findById(s.getIdeaId());
            idea.setCollectedFunds(idea.getCollectedFunds() + s.getFunded());
            ideaService.save(idea, userName);
        });
    }

    @Override
    public List<Funding> save(List<Funding> fundingList) {
        return fundingRepository.save(fundingList);
    }
}
