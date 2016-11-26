package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.Idea;
import com.infiniteideas.model.ShoppingCartItem;
import com.infiniteideas.model.UserPersonalDetails;
import com.infiniteideas.repository.FundingRepository;
import com.infiniteideas.repository.UserPersonalDetailsRepository;
import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserPersonalDetailsService;
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
    private UserPersonalDetailsService userPersonalDetailsService;
    private UserPersonalDetailsRepository userPersonalDetailsRepository;

    @Autowired
    public CheckoutServiceImpl(FundingRepository fundingRepository, IdeaService ideaService, UserService userService, UserPersonalDetailsService userPersonalDetailsService, UserPersonalDetailsRepository userPersonalDetailsRepository) {
        this.fundingRepository = fundingRepository;
        this.ideaService = ideaService;
        this.userService = userService;
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.userPersonalDetailsRepository = userPersonalDetailsRepository;
    }


    @Override
    public void makeTransactions(Map<String, ShoppingCartItem> itemMap, String userName) {
        List<Funding> fundingList = new ArrayList<>();
        Long userId = userService.findByUsername(userName).getId();
        UserPersonalDetails details = userPersonalDetailsRepository.findOne(userId);

        itemMap.forEach((key, value) -> {
            Funding funding = new Funding();
            funding.setUserId(userId);
            funding.setIdeaId(value.getId());
            funding.setFunded(value.getFunds());
            details.setCoupons(details.getCoupons() - value.getFunds());
            fundingList.add(funding);
        });

        List<Funding> validation = save(fundingList);
        if (validation.size() == fundingList.size()){
            makeIdeaUpdate(validation, userName);
        }
        userPersonalDetailsRepository.save(details);

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

    @Override
    public Integer getRevenue() {
       return fundingRepository.getRevenue();
    }

    @Override
    public void deleteTransaction(Long id) {
        Funding funding = fundingRepository.findOne(id);
        fundingRepository.delete(id);
        userPersonalDetailsService.setRefundedCoupons(funding.getFunded(), funding.getUserId());
        ideaService.processRefund(funding.getIdeaId(), funding.getFunded());
    }
}
