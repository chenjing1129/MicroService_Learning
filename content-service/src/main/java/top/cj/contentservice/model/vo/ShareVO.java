package top.cj.contentservice.model.vo;

import lombok.Data;
import top.cj.contentservice.model.dto.UserDTO;
import top.cj.contentservice.model.entity.Share;

@Data
public class ShareVO {
    private Share share;
    private UserDTO user;
}
