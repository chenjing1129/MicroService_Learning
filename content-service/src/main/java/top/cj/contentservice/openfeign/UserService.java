package top.cj.contentservice.openfeign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import top.cj.contentservice.common.result.Result;
import top.cj.contentservice.model.dto.UserDTO;

@FeignClient(value = "user-service")
public interface UserService {
    @GetMapping(value = "/user/{id}")
    Result<UserDTO> getUserById(@PathVariable Integer id);
}
