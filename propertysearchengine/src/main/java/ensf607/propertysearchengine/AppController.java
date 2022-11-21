package ensf607.propertysearchengine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import ensf607.propertysearchengine.user.*;
import ensf607.propertysearchengine.property.*;

@Controller
public class AppController {
 
    @Autowired
    private UserRepository userRepo;
     
    @GetMapping("")
    public String viewHomePage() {
        return "index.html";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "signup_form";
    }

    @PostMapping("/process_register")
    public String processRegister(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        
        userRepo.save(user);
        
        return "register_success";
    }

    @GetMapping("/testingoptions")
    public String testingOptions() {
        return "optionslist";
    }

    @GetMapping("api/v1/property/add")
    public String addNewProperty(Model model) {
        model.addAttribute("property", new Property());
        return "add_property_form";
    }
}