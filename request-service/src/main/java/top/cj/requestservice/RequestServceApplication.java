package top.cj.requestservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = "top.cj.requestservice.openfeign")
public class RequestServceApplication {

    public static void main(String[] args) {
        SpringApplication.run(RequestServceApplication.class, args);
    }

}
