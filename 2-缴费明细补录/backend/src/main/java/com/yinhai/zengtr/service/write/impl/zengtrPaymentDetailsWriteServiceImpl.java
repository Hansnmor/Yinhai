package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.write.zengtrPaymentDetailsWriteMapper;
import com.yinhai.zengtr.service.write.zengtrPaymentDetailsWriteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@NoTransactional
public class zengtrPaymentDetailsWriteServiceImpl extends BaseRestService implements zengtrPaymentDetailsWriteService {

	@Resource
	private zengtrPaymentDetailsWriteMapper zengtrPaymentDetailsWriteMapper;
}
