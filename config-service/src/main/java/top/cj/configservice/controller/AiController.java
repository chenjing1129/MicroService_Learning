package top.cj.configservice.controller;

import com.mashape.unirest.http.exceptions.UnirestException;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.cj.configservice.service.AiService;

import java.io.IOException;

@RestController
@RequestMapping("/ai")
public class AiController {

    @Resource
    private AiService aiService;

    @PostMapping("/DeepSeek")
    public String DeepSeek(@RequestBody String question) throws UnirestException, IOException {
        return aiService.callDeepSeekAPI(question);
    }

}
