package top.cj.contentservice.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cj.contentservice.model.entity.Share;

public interface ShareService extends IService<Share> {
    Share getShareById(Integer id);
}
