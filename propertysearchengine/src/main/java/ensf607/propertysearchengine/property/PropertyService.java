package ensf607.propertysearchengine.property;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PropertyService {

    private final PropertyRepository propertyRepository;

    @Autowired
    public PropertyService(PropertyRepository propertyRepository) {
        this.propertyRepository = propertyRepository;
    }


    public Optional<List<Property>> getPropertyByBathrooms(int bathrooms) {
        return propertyRepository.findAllByBathrooms(bathrooms);
    }

    public void addNewProperty(Property property) {
        propertyRepository.save(property);
    }

    public List<Property> viewAllListings() {
        return propertyRepository.findAll();
    }

    public Optional<Property> viewListingByMLS(int mls) {
        return propertyRepository.findById(mls);
    }


}
