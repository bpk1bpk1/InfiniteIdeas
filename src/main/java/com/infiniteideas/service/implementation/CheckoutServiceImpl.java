package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.ShoppingCartItem;
import com.infiniteideas.repository.FundingRepository;
import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CheckoutServiceImpl implements CheckoutService {

    private FundingRepository fundingRepository;

    @Autowired
    public CheckoutServiceImpl(FundingRepository fundingRepository) {
        this.fundingRepository = fundingRepository;
    }


    @Override
    public void makeTransactions(Map<String, ShoppingCartItem> itemMap, String userName, UserService userService) {
        List<Funding> fundingList = new ArrayList<>();
        Long userId = userService.findByUsername(userName).getId();

        itemMap.forEach((key, value) -> {
            Funding funding = new Funding();
            funding.setUserId(userId);
            funding.setIdeaId(value.getId());
            funding.setFunded(value.getFunds());
            fundingList.add(funding);
        });

        save(fundingList);
    }

    @Override
    public List<Funding> save(List<Funding> fundingList) {
        return fundingRepository.save(fundingList);
    }
}
