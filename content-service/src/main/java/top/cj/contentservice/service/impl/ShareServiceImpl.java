package top.cj.contentservice.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import top.cj.contentservice.model.entity.Share;
import top.cj.contentservice.mapper.ShareMapper;
import top.cj.contentservice.service.ShareService;

@Service
@AllArgsConstructor
public class ShareServiceImpl extends ServiceImpl<ShareMapper, Share> implements ShareService {

    private final ShareMapper shareMapper;
    @Override
    public Share getShareById(Integer id) {
        return shareMapper.selectById(id);
    }
}
