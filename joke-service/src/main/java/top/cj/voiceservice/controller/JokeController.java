package top.cj.voiceservice.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.cj.voiceservice.service.JokeService;

@RestController
@RequestMapping("/jokes")
public class JokeController {

    @Resource
    private JokeService jokeService;

    @GetMapping("/random")
    public String getRandomJoke() {
        return jokeService.getRandomJoke();
    }
}