package com.infiniteideas.service.implementation;

import com.infiniteideas.model.User;
import com.infiniteideas.model.UserPersonalDetails;
import com.infiniteideas.repository.UserPersonalDetailsRepository;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.GeoConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Hashtable;
import java.util.List;
import java.util.Objects;

@Service
public class UserPersonalDetailsServiceImpl implements UserPersonalDetailsService{

    private final UserPersonalDetailsRepository userPersonalDetailsRepository;
    private final UserService userService;
    private GeoConverter geoConverter;

    @Autowired
    public UserPersonalDetailsServiceImpl(UserPersonalDetailsRepository userPersonalDetailsRepository, UserService userService) {
        this.userPersonalDetailsRepository = userPersonalDetailsRepository;
        this.userService = userService;
        geoConverter = new GeoConverter();
    }

    @Override
    public Hashtable<String, String> getCustomerLocations() {
        Hashtable<String, String> locations = new Hashtable<>();

        List<UserPersonalDetails> details = userPersonalDetailsRepository.findAll();
        details.forEach(s -> getCoordinates(locations, s));

        return locations;
    }

    @Override
    public String save(UserPersonalDetails details, String name) {
        User user = userService.findByUsername(name);
        details.setId(user.getId());
        userPersonalDetailsRepository.save(details);
        return user.getSelectedRole();
    }

    @Override
    public Hashtable<String, String> getUsersNearMe(String name) {
        Hashtable<String, String> locations = new Hashtable<>();
        locations = getAllUsersNearMe(name, locations);

        return locations;
    }

    private Hashtable<String, String> getAllUsersNearMe(String name, Hashtable<String, String> locations) {
        User user = userService.findByUsername(name);
        UserPersonalDetails details = userPersonalDetailsRepository.findOne(user.getId());
        List<UserPersonalDetails> allDetails = userPersonalDetailsRepository.findAll();

        allDetails.stream()
                    .filter(u -> Objects.equals(u.getCountry().toLowerCase(), details.getCountry().toLowerCase()))
                    .forEach(s -> getCoordinates(locations, s));

        return locations;
    }

    private void getCoordinates(Hashtable<String, String> locations, UserPersonalDetails s) {
        String[] latLong = geoConverter.getLocation(s.getStreet() + "," + s.getCity() +
                "," + s.getState() + "," + s.getCountry());
        locations.put(latLong[0], latLong[1]);
    }
}
