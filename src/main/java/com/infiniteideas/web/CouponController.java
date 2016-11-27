package com.infiniteideas.web;

import com.infiniteideas.service.UserPersonalDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CouponController {
    private final UserPersonalDetailsService userPersonalDetailsService;

    @Autowired
    public CouponController(UserPersonalDetailsService userPersonalDetailsService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
    }

    @RequestMapping(value = "/coupons")
    public String coupons(){
        return String.valueOf(userPersonalDetailsService.getUserCoupons());
    }
}
