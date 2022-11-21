package ensf607.propertysearchengine.amenity;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface amenityRepository extends JpaRepository<Amenity, String> {

}
