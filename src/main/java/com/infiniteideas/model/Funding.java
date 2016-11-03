package com.infiniteideas.model;

import javax.persistence.*;

@Entity
@Table(name = "funding")
public class Funding {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "user_id")
    private Long userId;
    @Column(name = "idea_id")
    private Long ideaId;
    @Column(name = "funded")
    private Double funded;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getIdeaId() {
        return ideaId;
    }

    public void setIdeaId(Long ideaId) {
        this.ideaId = ideaId;
    }

    public Double getFunded() {
        return funded;
    }

    public void setFunded(Double funded) {
        this.funded = funded;
    }
}
