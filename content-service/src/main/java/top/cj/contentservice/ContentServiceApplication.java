package top.cj.contentservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import top.cj.contentservice.common.config.CjProperties;

@SpringBootApplication
@EnableFeignClients(basePackages = "top.cj.contentservice.openfeign")
@MapperScan("top.cj.contentservice.mapper")
@EnableConfigurationProperties(CjProperties.class)
public class ContentServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ContentServiceApplication.class, args);
    }

}
