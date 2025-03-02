package top.cj.requestservice.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@RestController
public class ConsumerController3 {
    private final String SERVICE_URL = "http://localhost:8080";
    private final String SERVICE_URL1 = "https://www.wanandroid.com";

    private final WebClient webClient = WebClient.builder()
            .baseUrl(SERVICE_URL)
            .build();

    private final WebClient webClient1 = WebClient.builder()
            .baseUrl(SERVICE_URL1)
            .build();

    @GetMapping("/webClientTest")
    public String webClientTest() {
        Mono<String> mono = webClient
                .get()
                .uri("/hello")
                .retrieve()
                .bodyToMono(String.class);
        mono.subscribe(System.out::println);
        return "请求成功";
    }

    @GetMapping("/webClientTest1")
    public String webClientTest1(Integer pageSize) {
        Mono<String> mono = webClient1
                .get()
                .uri(uriBuilder -> uriBuilder.path("/article/list/{pageSize}/json")
                        .build(pageSize))
                .retrieve()
                .bodyToMono(String.class);
        return mono.map(response -> {
            try {
                ObjectMapper objectMapper = new ObjectMapper();
                ObjectNode objectNode = (ObjectNode) objectMapper.readTree(response);
                return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(objectNode);
            } catch (Exception e) {
                e.printStackTrace();
                return "Error formatting JSON";
            }
        }).block(); // 将Mono转换为String并返回
    }
}
