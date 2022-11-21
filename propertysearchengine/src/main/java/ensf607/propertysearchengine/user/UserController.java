package ensf607.propertysearchengine.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Optional;

@RestController
@RequestMapping(path = "api/v1/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login/{email}/{password}")
    public Boolean verifyPassword(@PathVariable("email") String email, @PathVariable("password") String password) {

        Optional<User> user = userService.getUserByEmail(email);

        if(!user.isPresent()) {
            return false;
        }
        else {
            if (user.get().getPassword().equals(password)) {
                return true;
            }
        }

        return false;
    }

    @PostMapping("/register")
    public void registerNewUser(@RequestBody User user) {
        userService.addNewUser(user);
    }

    @GetMapping("/addtofavourites") 
    public void addFavouriteToUser(@RequestParam int mls, Principal principal) {
        String userEmail = principal.getName();
        userService.addFavourite(userEmail, mls);
    }

    @GetMapping("/removefromfavourites") 
    public void removeFavouriteFromUser(@RequestParam int mls, Principal principal) {
        String userEmail = principal.getName();
        userService.removeFavourite(userEmail, mls);
    }
}