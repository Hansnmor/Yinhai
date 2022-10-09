package com.yinhai.zengtr.mapper.write;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.FlxReimRegInfoDAddVo;

import java.util.List;

public interface zengtrFlexibleReimbursementWriteMapper extends Ta404SupportMapper {
	void insertSubmitList(List<FlxReimRegInfoDAddVo> flxReimRegInfoDAddVos);
}
