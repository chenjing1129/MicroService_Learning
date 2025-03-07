package top.cj.user_service.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import top.cj.user_service.common.config.CjProperties;
import top.cj.user_service.common.result.Result;
import top.cj.user_service.model.dto.UserDTO;
import top.cj.user_service.service.UserService;

import static top.cj.user_service.common.exception.ErrorCode.NOT_FOUND;
import static top.cj.user_service.common.exception.ErrorCode.SERVICE_UNAVAILABLE;

@RequestMapping("/user")
@RestController
@AllArgsConstructor
public class UserController {

    private RestTemplate restTemplate;

    private final UserService userService;

    private final CjProperties cjProperties;


    public String getUser(@RequestParam String username) {
        return "User:" + username ;
    }

    @GetMapping("/ai")
    public String askAI(@RequestParam String question) {
        return restTemplate.getForObject("http://localhost:8084/ai/ask?question=" + question ,String.class);
    }

    @GetMapping("/{id}")
    public Result<UserDTO> getUserInfo(@PathVariable Integer id) {
            if (userService.getInfoById(id) != null) {
                return Result.ok(userService.getInfoById(id));
            } else {
                return Result.error(NOT_FOUND);
            }
        }
}
