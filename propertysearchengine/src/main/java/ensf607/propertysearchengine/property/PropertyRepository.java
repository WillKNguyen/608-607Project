package ensf607.propertysearchengine.property;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface PropertyRepository extends JpaRepository<Property, Integer> {
    Optional<List<Property>> findAllByBathrooms(double bathrooms);

}
