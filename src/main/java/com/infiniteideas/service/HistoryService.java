package com.infiniteideas.service;

import com.infiniteideas.model.Funding;

import java.util.List;

public interface HistoryService {

    List<Funding> findAllTransactions(String name);
}
