package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.User;
import com.infiniteideas.repository.FundingRepository;
import com.infiniteideas.service.HistoryService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService{

    private FundingRepository fundingRepository;
    private UserService userService;

    @Autowired
    public HistoryServiceImpl(FundingRepository fundingRepository, UserService userService) {
        this.fundingRepository = fundingRepository;
        this.userService = userService;
    }


    @Override
    public List<Funding> findAllTransactions(String name) {
        User user = userService.findByUsername(name);
        return fundingRepository.getUserTransactions(user.getId());
    }
}
