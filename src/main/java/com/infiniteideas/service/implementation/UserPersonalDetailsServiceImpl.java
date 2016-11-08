package com.infiniteideas.service.implementation;

import com.infiniteideas.model.UserPersonalDetails;
import com.infiniteideas.repository.UserPersonalDetailsRepository;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.utils.GeoConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Hashtable;
import java.util.List;

@Service
public class UserPersonalDetailsServiceImpl implements UserPersonalDetailsService{

    private final UserPersonalDetailsRepository userPersonalDetailsRepository;

    @Autowired
    public UserPersonalDetailsServiceImpl(UserPersonalDetailsRepository userPersonalDetailsRepository) {
        this.userPersonalDetailsRepository = userPersonalDetailsRepository;
    }


    @Override
    public List<UserPersonalDetails> findAll() {
        return userPersonalDetailsRepository.findAll();
    }

    @Override
    public Hashtable<String, String> getCustomerLocations() {
        GeoConverter geoConverter = new GeoConverter();
        Hashtable<String, String> locations = new Hashtable<>();

        List<UserPersonalDetails> details = findAll();
        details.forEach(s -> {
            String[] latLong = geoConverter.getLocation(s.getStreet() + "," + s.getCity() +
                    "," + s.getState() + "," + s.getCountry());
            locations.put(latLong[0], latLong[1]);
        });

        return locations;
    }
}
