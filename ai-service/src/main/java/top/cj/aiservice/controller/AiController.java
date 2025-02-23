package top.cj.aiservice.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.cj.aiservice.service.AiService;

import java.util.Arrays;

@RestController
@RequestMapping("/ai")
public class AiController {

    @Resource
    private AiService aiService;

    @GetMapping("/ask")
    public String askQuestion(@RequestParam String question) {
        return aiService.callAiModel(question);
    }
}
