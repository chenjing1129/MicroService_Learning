package top.cj.user_service.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import top.cj.user_service.model.entity.User;

@Mapper
public interface UserMapper extends BaseMapper<User> {
}
