package ensf607.propertysearchengine.neighbourhood;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NeighbourhoodService {

    private final NeighbourhoodRepository neighbourhoodRepository;

    @Autowired
    public NeighbourhoodService(NeighbourhoodRepository neighbourhoodRepository) {
        this.neighbourhoodRepository = neighbourhoodRepository;
    }

    // public Optional<Neighbourhood> getNeighbourhoodByID(int id) {
    //     return neighbourhoodRepository.findById(id);
    // }

    // public void addNewneighbourhood(Neighbourhood neighbourhood) {
    //     neighbourhoodRepository.save(neighbourhood);
    // }


}
