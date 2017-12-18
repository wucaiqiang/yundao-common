package com.yundao.common.dto.department;

import com.yundao.common.constant.CodeConstant;
import com.yundao.core.code.config.CommonCode;
import com.yundao.core.validator.group.Update;
import com.yundao.core.validator.length.Length;
import com.yundao.core.validator.number.Number;
import io.swagger.annotations.ApiModelProperty;

/**
 * Created by gjl on 2017/6/23.
 */
public class DepartmentReqDto {
    @ApiModelProperty(value = "新增不需要传")
    @Number(isBlank = false, message = "{" + CommonCode.COMMON_1003+ "}", groups = {Update.class})
    private Long id;
    /**
     * 父id
     */
    @ApiModelProperty(value = "父id，首级传0")
    @Number(message = "{" + CommonCode.COMMON_1018+ "}")
    private Long parentId;

    /**
     * 系统编码
     */
    @ApiModelProperty(value = "对应系统表的code")
    @Length(min = 1,max = 32,message = "{" + CommonCode.COMMON_1026 + "}")
    private String systemCode;

    /**
     * 名字
     */
    @ApiModelProperty(value = "部门名称")
    @Length(min = 1,max = 32,message = "{" + CodeConstant.CODE_1000001 + "}")
    private String name;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    @Length(min = 1,max = 512,message = "{" + CommonCode.COMMON_1054 + "}")
    private String description;

    /**
     * 排序，越小越靠前
     */
    @ApiModelProperty(value = "排序，越小越靠前")
    @Number(message = "{" + CommonCode.COMMON_1069+ "}")
    private Integer sequence;

    private static final long serialVersionUID = 1L;

    public String getSystemCode() {
        return systemCode;
    }

    public void setSystemCode(String systemCode) {
        this.systemCode = systemCode;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
