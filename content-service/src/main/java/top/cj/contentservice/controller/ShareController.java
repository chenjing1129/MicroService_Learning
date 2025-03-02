package top.cj.contentservice.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.cj.contentservice.model.dto.UserDTO;
import top.cj.contentservice.model.entity.Share;
import top.cj.contentservice.model.vo.ShareVO;
import top.cj.contentservice.openfeign.UserService;
import top.cj.contentservice.service.ShareService;

@RestController
@RequestMapping("/share")
@AllArgsConstructor
public class ShareController {

    private final ShareService shareService;

    private final UserService userService;

    @GetMapping("/{id}")
    public ShareVO getShareById(@PathVariable Integer id) {
        Share share = shareService.getShareById(id);
        UserDTO user = userService.getUserById(share.getUserId());
        ShareVO shareVO = new ShareVO();
        shareVO.setShare(share);
        shareVO.setUser(user);
        return shareVO;
    }
}
