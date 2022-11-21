package ensf607.propertysearchengine.neighbourhood;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(path = "api/v1/")
public class NeighbourhoodController {

    private final NeighbourhoodService neighbourhoodService;

    @Autowired
    public NeighbourhoodController(NeighbourhoodService neighbourhoodService) {
        this.neighbourhoodService = neighbourhoodService;
    }

    // @GetMapping("/search/{bathrooms}")
    // public List<Neighbourhood> searchForProperty(@PathVariable int bathrooms) {

    //     Optional<List<Neighbourhood>> property = neighbourhoodService.getPropertyByBathrooms(bathrooms);

    //     if(!property.isPresent()) {
    //             throw new IllegalStateException("Requested property cannot be found!");
    //     }
    //     else {
    //         return property.get();
    //     }

    // }

    // @PostMapping("/add")
    // public void registerNewUser(@RequestBody Neighbourhood property) {
    //     neighbourhoodService.addNewProperty(property);
    // }

}

