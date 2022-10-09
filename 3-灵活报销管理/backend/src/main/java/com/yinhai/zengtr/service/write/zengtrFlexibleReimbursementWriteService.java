package com.yinhai.zengtr.service.write;

import com.yinhai.zengtr.vo.FlxReimRegInfoDAddVo;

import java.util.List;

public interface zengtrFlexibleReimbursementWriteService {
	void insertSubmitList(List<FlxReimRegInfoDAddVo> flxReimRegInfoDAddVos) throws Exception;
}
