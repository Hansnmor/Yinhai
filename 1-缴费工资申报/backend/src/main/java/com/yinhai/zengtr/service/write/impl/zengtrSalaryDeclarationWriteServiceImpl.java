package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.write.zengtrSalaryDeclarationWriteMapper;
import com.yinhai.zengtr.service.write.zengtrSalaryDeclarationWriteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@NoTransactional
public class zengtrSalaryDeclarationWriteServiceImpl  extends BaseRestService implements zengtrSalaryDeclarationWriteService {
	@Resource
	private com.yinhai.zengtr.mapper.write.zengtrSalaryDeclarationWriteMapper zengtrSalaryDeclarationWriteMapper;
}
