package ensf607.propertysearchengine.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ensf607.propertysearchengine.property.PropertyRepository;
import ensf607.propertysearchengine.property.*;

import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    PropertyRepository propertyRepository;


    public Optional<User> getUserByEmail(String email) {
        return userRepository.findById(email);
    }

    public void addNewUser(User user) {
        Optional<User> userByEmail = getUserByEmail(user.getEmail());
        if (userByEmail.isPresent()) {
            throw new IllegalStateException("This email is already taken!");
        }
        userRepository.save(user);
    }

    public void addFavourite(String userEmail, Integer propertyMLS) {
        Optional<User> userByEmail = getUserByEmail(userEmail);
        if (!userByEmail.isPresent()) {
            throw new IllegalStateException("This user does not exist");
        }
        User user = userByEmail.get();

        Optional<Property> propertyById = propertyRepository.findById(propertyMLS);
        if (!propertyById.isPresent()) {
            throw new IllegalStateException("This property does not exist");
        }
        Property property = propertyById.get();

        user.addFavourite(property);
        userRepository.save(user);
    }

    public void removeFavourite(String userEmail, Integer propertyMLS) {
        Optional<User> userByEmail = getUserByEmail(userEmail);
        if (!userByEmail.isPresent()) {
            throw new IllegalStateException("This user does not exist");
        }
        User user = userByEmail.get();

        Optional<Property> propertyById = propertyRepository.findById(propertyMLS);
        if (!propertyById.isPresent()) {
            throw new IllegalStateException("This property does not exist");
        }
        Property property = propertyById.get();

        user.removeFavourite(property);
        userRepository.save(user);
    }


}
