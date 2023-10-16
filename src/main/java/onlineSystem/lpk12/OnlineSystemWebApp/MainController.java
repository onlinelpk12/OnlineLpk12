package onlineSystem.lpk12.OnlineSystemWebApp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
//@RequestMapping("/online")
public class MainController {


    @GetMapping("/test")
    public String testThisController()
    {
        return "home";
    }
}
