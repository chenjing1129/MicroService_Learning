package top.cj.requestservice.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.cj.requestservice.model.dto.UserDTO;
import top.cj.requestservice.model.entity.User;
import top.cj.requestservice.openfeign.UserService;

import java.util.List;

@RestController
public class ConsumerController5 {
    @Resource
    private UserService userService;

    @GetMapping("/user")
    public List<User> getUsers() {
        return userService.getUser();
    }

    @GetMapping("/user/{id}")
    public User getUserById(@PathVariable Integer id) {
        return userService.getUserById(id);
    }

    @PostMapping("/user")
    public User createUser(@RequestBody UserDTO user) {
        return userService.createUser(user);
    }

    @PutMapping("/user/{id}")
    public User updateUser(@PathVariable Integer id, @RequestBody UserDTO user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/user/{id}")
    public String deleteUser(@PathVariable Integer id) {
        return userService.deleteUser(id);
    }
}