package top.cj.user_service.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "cj")
@Data
public class CjProperties {

    private String username;

    private String job;

    private Boolean serviceFlag;
}
