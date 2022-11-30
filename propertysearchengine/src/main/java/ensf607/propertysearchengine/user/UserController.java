package ensf607.propertysearchengine.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import ensf607.propertysearchengine.property.Property;

import java.security.Principal;
import java.util.Set;

@RestController
@RequestMapping(path = "api/v1/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/addtofavourites") 
    public String addFavouriteToUser(@RequestParam int mls, Principal principal) {
        String userEmail = principal.getName();
        userService.addFavourite(userEmail, mls);
        return userService.addFavourite(userEmail, mls);
    }

    @GetMapping("/addtofavourites_postman") 
    public String addFavouriteToUserPostman(@RequestParam int mls) {
        String userEmail = "ardit.baboci@gmail.com";
        return userService.addFavourite(userEmail, mls);
    }

    @GetMapping("/removefromfavourites") 
    public String removeFavouriteFromUser(@RequestParam int mls, Principal principal) {
        String userEmail = principal.getName();
        userService.removeFavourite(userEmail, mls);
        return userService.removeFavourite(userEmail, mls);
    }

    @GetMapping("/removefromfavourites_postman") 
    public String removeFavouriteFromUser(@RequestParam int mls) {
        String userEmail = "ardit.baboci@gmail.com";
        return userService.removeFavourite(userEmail, mls);
    }

}
