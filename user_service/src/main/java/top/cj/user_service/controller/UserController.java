package top.cj.user_service.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class UserController {
    @Resource
    private RestTemplate restTemplate;

    @GetMapping("/user")
    public String getUser(@RequestParam String username) {
        return "User:" + username ;
    }

    @GetMapping("/ai")
    public String askAI(@RequestParam String question) {
        return restTemplate.getForObject("http://localhost:8084/ai/ask?question=" + question ,String.class);
    }
}
