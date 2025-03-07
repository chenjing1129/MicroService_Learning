package top.cj.user_service.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import top.cj.user_service.common.config.CjProperties;

@RestController
//@RefreshScope
public class TestController {

//    @Value("${cj.username}")
//    private String username;
//
//    @Value("${cj.job}")
//    private String job;

    @Resource
    private CjProperties cjProperties;


    @GetMapping("/test")
    public String get() {
        return "username:" + cjProperties.getUsername() + ",job:" + cjProperties.getJob();
    }
}
