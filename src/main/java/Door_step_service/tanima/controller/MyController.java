
package Door_step_service.tanima.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
  public class MyController {
  @GetMapping("/")
  String go1(){
      
      return "index.jsp";
  }
}
    