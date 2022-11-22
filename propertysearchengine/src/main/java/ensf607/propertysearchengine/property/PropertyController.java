package ensf607.propertysearchengine.property;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(path = "api/v1/property")
public class PropertyController {

    private final PropertyService propertyService;

    @Autowired
    public PropertyController(PropertyService propertyService) {
        this.propertyService = propertyService;
    }

    @GetMapping("/search/{bathrooms}")
    public List<Property> searchForProperty(@PathVariable int bathrooms) {

        Optional<List<Property>> property = propertyService.getPropertyByBathrooms(bathrooms);

        if(!property.isPresent()) {
                throw new IllegalStateException("Requested property cannot be found!");
        }
        else {
            return property.get();
        }
        

    }

    @GetMapping("/viewalllistings")
    public List<Property> viewAllListings() {
       return propertyService.viewAllListings();
    }

    @GetMapping("/viewalisting")
    public Property viewAListing(@RequestParam int mls) {
        Optional<Property> propertyByID = propertyService.viewListingByMLS(mls);
        
        if(!propertyByID.isPresent()) {
            throw new IllegalStateException("Requested property cannot be found!");
        }
        else {
            return propertyByID.get();
        }
    }

    @GetMapping("/remove")
    public String removeAListing(@RequestParam int mls, Principal principal) {
        String userEmail = principal.getName();
        return propertyService.removeAListing(mls, userEmail);
    }

    @GetMapping("/update")
    public String updatePrice(@RequestParam int mls, @RequestParam int newprice, Principal principal) {
        String userEmail = principal.getName();
        return propertyService.updatePrice(mls, newprice, userEmail);
    }

    @PostMapping("/add_property")
    public void registerNewProperty(Property property, Principal principal) {
        String userEmail = principal.getName();
        propertyService.addNewProperty(property, userEmail);
    }



}

