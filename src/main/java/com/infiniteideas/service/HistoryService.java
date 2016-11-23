package com.infiniteideas.service;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.Idea;

import java.util.List;
import java.util.Map;

public interface HistoryService {

    Map<Funding, Idea> findAllTransactions(String name);

    Map<Funding, Idea> getUserIdeas(List<Funding> fundHistory);

    Map<Funding, Idea> getUserIdeas(String name);
}
