package onlineSystem.lpk12.OnlineSystemWebApp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {


    @GetMapping("/home")
    public String mainPath()
    {
        return "home";
    }
}
