package top.cj.user_service.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import top.cj.user_service.model.dto.UserDTO;
import top.cj.user_service.service.UserService;

@RequestMapping("/user")
@RestController
@AllArgsConstructor
public class UserController {

    private RestTemplate restTemplate;

    private final UserService userService;

    public String getUser(@RequestParam String username) {
        return "User:" + username ;
    }

    @GetMapping("/ai")
    public String askAI(@RequestParam String question) {
        return restTemplate.getForObject("http://localhost:8084/ai/ask?question=" + question ,String.class);
    }

    @GetMapping("/{id}")
    public UserDTO getUserInfo(@PathVariable Integer id) {
        return userService.getInfoById(id);
    }
}
