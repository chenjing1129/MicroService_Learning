package top.cj.configservice.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 86139
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Address {
    private static final long serialVersionUID = -7721414184811499L;
    private String province;
    private String city;
}
