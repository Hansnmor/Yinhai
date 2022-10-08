package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.write.zengtrFlexibleReimbursementWriteMapper;
import com.yinhai.zengtr.service.write.zengtrFlexibleReimbursementWriteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@NoTransactional
public class zengtrFlexibleReimbursementWriteServiceImpl extends BaseRestService implements zengtrFlexibleReimbursementWriteService {

	@Resource
	private zengtrFlexibleReimbursementWriteMapper zengtrFlexibleReimbursementWriteMapper;
}
