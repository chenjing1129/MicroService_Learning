package top.cj.requestservice.openfeign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;
import top.cj.requestservice.model.dto.UserDTO;
import top.cj.requestservice.model.entity.User;

import java.util.List;

@FeignClient(value = "node-service")
public interface UserService {
    @GetMapping("/user")
    List<User> getUser();

    @GetMapping("/user/{id}")
    User getUserById(@PathVariable("id") Integer id);

    @PostMapping("/user")
    User createUser(@RequestBody UserDTO user);

    @PutMapping("/user/{id}")
    User updateUser(@PathVariable("id") Integer id, @RequestBody UserDTO user);

    @DeleteMapping("/user/{id}")
    String deleteUser(@PathVariable("id") Integer id);
}
