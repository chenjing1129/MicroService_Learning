package top.cj.configservice;

import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import top.cj.configservice.entity.Address;
import top.cj.configservice.entity.Student;

@SpringBootTest
class ConfigServiceApplicationTests {
    @Resource
    private RedisTemplate<String, Student> redisTemplate;

    @Test
    void test1() {
        Address address = Address.builder().province("江苏").city("苏州").build();
        Student student = Student.builder().id("123").name("cj").address(address).build();
        redisTemplate.opsForValue().set("student", student);
    }

}
