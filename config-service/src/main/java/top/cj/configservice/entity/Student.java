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
public class Student {

    private static final long serialVersionUID = 1947193751751052L;
    private String id;
    private String name;
    private Address address;
}
