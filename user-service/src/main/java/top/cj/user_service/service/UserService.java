package top.cj.user_service.service;


import com.baomidou.mybatisplus.extension.service.IService;
import top.cj.user_service.model.dto.UserDTO;
import top.cj.user_service.model.entity.User;

public interface UserService extends IService<User> {
    UserDTO getInfoById(Integer id);
}
