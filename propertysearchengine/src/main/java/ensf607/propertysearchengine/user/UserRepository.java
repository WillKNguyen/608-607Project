package ensf607.propertysearchengine.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ensf607.propertysearchengine.property.Property;


@Repository
public interface UserRepository extends JpaRepository<User, String> {
    
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    public User findByEmail(String email);

    // @Query("SELECT f FROM favourite_properties f WHERE f.email = ?1")
    // public List<Property> findFavouriteByEmail(String email);
}
