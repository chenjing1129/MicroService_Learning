package top.cj.user_service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import top.cj.user_service.mapper.UserMapper;
import top.cj.user_service.model.dto.UserDTO;
import top.cj.user_service.model.entity.User;
import top.cj.user_service.service.UserService;

@Service
@AllArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private final UserMapper userMapper;

    @Override
    public UserDTO getInfoById(Integer id) {
        User user = userMapper.selectById(id);
        UserDTO userDTO = new UserDTO();
        if (user != null) {
            userDTO.setUserId(user.getId());
            userDTO.setUserName(user.getUserName());
            userDTO.setAvatarUrl(user.getAvatarUrl());
            return userDTO;
        } else {
            return null;
        }

    }
}
