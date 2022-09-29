package com.yinhai.zengtr.service.read.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.read.zengtrPaymentDetailsReadMapper;
import com.yinhai.zengtr.service.read.zengtrPaymentDetailsReadService;
import com.yinhai.zengtr.vo.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@NoTransactional
public class zengtrPaymentDetailsReadServiceImpl extends BaseRestService implements zengtrPaymentDetailsReadService {
	@Resource
	private zengtrPaymentDetailsReadMapper zengtrPaymentDetailsReadMapper;

	@Override
	public List<PsnInfoBQueryVo> queryPsnInfo(String psnNo) {
		return zengtrPaymentDetailsReadMapper.queryPsnInfo(psnNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo) {
		return zengtrPaymentDetailsReadMapper.queryPsnInsuInfoByPsnNo(psnNo);
	}

	@Override
	public List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo) {
		return zengtrPaymentDetailsReadMapper.queryEmpInfo(empNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo) {
		return zengtrPaymentDetailsReadMapper.queryPsnInsuInfoByEmpNo(empNo);
	}

	@Override
	public List<EmpInsuDQueryVo> queryClctRuleTypeCodg(String empNo) {
		return zengtrPaymentDetailsReadMapper.queryClctRuleTypeCodg(empNo);
	}

	@Override
	public List<UebmiClctDetlDQueryVo> queryClctInfoList(String empNo) {
		return zengtrPaymentDetailsReadMapper.queryClctInfoList(empNo);
	}
}
