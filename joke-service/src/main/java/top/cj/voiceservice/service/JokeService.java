package top.cj.voiceservice.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import top.cj.voiceservice.entity.Joke;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.ResponseEntity;

@Service
public class JokeService {

    private static final Logger logger = LoggerFactory.getLogger(JokeService.class);
    private static final String JOKE_API_URL = "https://v2.jokeapi.dev/joke/Any";

    public String getRandomJoke() {
        RestTemplate restTemplate = new RestTemplate();
        try {
            logger.info("从API获取笑话: {}", JOKE_API_URL);
            ResponseEntity<String> response = restTemplate.getForEntity(JOKE_API_URL, String.class);
            logger.info("API响应: {}", response.getBody()); // 打印原始响应
            Joke joke = restTemplate.getForObject(JOKE_API_URL, Joke.class);
            return joke != null ? joke.toString() : "获取笑话失败。";
        } catch (Exception e) {
            logger.error("获取笑话时出错: {}", e.getMessage());
            return "获取笑话时出错: " + e.getMessage();
        }
    }
}