package top.cj.configservice.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import top.cj.configservice.utils.OssTemplate;


@RestController
@RequestMapping("/file")
public class OssController {

    @Resource
    private OssTemplate ossTemplate;

    @PostMapping("/oss")
    public String ossUpload(MultipartFile file) {
        return ossTemplate.uploadFile(file);
    }
}
