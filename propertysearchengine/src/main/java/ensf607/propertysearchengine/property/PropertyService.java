package ensf607.propertysearchengine.property;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ensf607.propertysearchengine.user.*;
import ensf607.propertysearchengine.pricehistory.*;

@Service
public class PropertyService {

    private final PropertyRepository propertyRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PriceHistoryRepository priceHistoryRepository;

    @Autowired
    public PropertyService(PropertyRepository propertyRepository) {
        this.propertyRepository = propertyRepository;
    }


    public Optional<List<Property>> getPropertyByBathrooms(int bathrooms) {
        return propertyRepository.findAllByBathrooms(bathrooms);
    }

    public void addNewProperty(Property property, String userEmail) {
        Optional<User> userByEmail = userRepository.findById(userEmail);
        if (!userByEmail.isPresent()) {
            throw new IllegalStateException("This user does not exist");
        }
        User user = userByEmail.get();

        property.setListingUser(user);
        
        propertyRepository.save(property);

        PriceHistory newEntry = new PriceHistory(property);
        priceHistoryRepository.save(newEntry);
    }

    public List<Property> viewAllListings() {
        return propertyRepository.findAll();
    }

    public String removeAListing(int mls, String userEmail) {

        Optional<Property> propertyByID = propertyRepository.findById(mls);
        if(!propertyByID.isPresent()) {
            throw new IllegalStateException("Requested property cannot be found!");
        }

        Property property = propertyByID.get();

        if(!property.getListingUserID().equals(userEmail)) {
            throw new IllegalStateException("This user did not create this listing!");
        }

        propertyRepository.delete(property);

        return "Requested listing has been deleted.";
        
    }

    public String updatePrice(int mls, int newPrice, String userEmail) {

        Optional<Property> propertyByID = propertyRepository.findById(mls);
        if(!propertyByID.isPresent()) {
            throw new IllegalStateException("Requested property cannot be found!");
        }

        Property property = propertyByID.get();

        if(!property.getListingUserID().equals(userEmail)) {
            throw new IllegalStateException("This user did not create this listing!");
        }

        property.setPrice(newPrice);
        propertyRepository.save(property);

        PriceHistory newEntry = new PriceHistory(property);
        priceHistoryRepository.save(newEntry);

        return "Price has been updated.";
    }



    public Optional<Property> viewListingByMLS(int mls) {
        return propertyRepository.findById(mls);
    }


}
