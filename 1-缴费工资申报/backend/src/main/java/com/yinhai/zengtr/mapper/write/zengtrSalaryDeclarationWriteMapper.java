package com.yinhai.zengtr.mapper.write;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.PsnWagDclaDQueryVo;

import java.util.List;

public interface zengtrSalaryDeclarationWriteMapper extends Ta404SupportMapper {
	void deleteOldWag(String psnNo);
}
