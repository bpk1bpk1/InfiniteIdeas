package com.infiniteideas.model;

import javax.persistence.*;

@Entity
@Table(name = "idea")
public class Idea {
    private Long id;
    private String name;
    private String description;
    @Column(name = "funds_required")
    private Double fundsRequired;
    @Column(name = "collected_funds")
    private Double collectedFunds;

    @Column(name = "category")
    private String category;

    @Column(name = "sub_category")
    private String sub_category;


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getFundsRequired() {
        return fundsRequired;
    }

    public void setFundsRequired(Double fundsRequired) {
        this.fundsRequired = fundsRequired;
    }

    public Double getCollectedFunds() {
        return collectedFunds;
    }

    public void setCollectedFunds(Double collectedFunds) {
        this.collectedFunds = collectedFunds;
    }





    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }



    public String getSub_category() {
        return sub_category;
    }

    public void setSub_category(String sub_category) {
        this.sub_category = sub_category;
    }
}
