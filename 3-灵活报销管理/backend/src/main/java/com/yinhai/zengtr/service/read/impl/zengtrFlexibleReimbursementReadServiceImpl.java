package com.yinhai.zengtr.service.read.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.read.zengtrFlexibleReimbursementReadMapper;
import com.yinhai.zengtr.service.read.zengtrFlexibleReimbursementReadService;
import com.yinhai.zengtr.vo.EmpInsuDQueryVo;
import com.yinhai.zengtr.vo.InsuEmpInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInsuDQueryVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@NoTransactional
public class zengtrFlexibleReimbursementReadServiceImpl extends BaseRestService implements zengtrFlexibleReimbursementReadService {

	@Resource
	private zengtrFlexibleReimbursementReadMapper zengtrFlexibleReimbursementReadMapper;

	@Override
	public List<PsnInfoBQueryVo> queryPsnInfo(String psnNo) {
		return zengtrFlexibleReimbursementReadMapper.queryPsnInfo(psnNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo) {
		return zengtrFlexibleReimbursementReadMapper.queryPsnInsuInfoByPsnNo(psnNo);
	}

	@Override
	public List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo) {
		return zengtrFlexibleReimbursementReadMapper.queryEmpInfo(empNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo) {
		return zengtrFlexibleReimbursementReadMapper.queryPsnInsuInfoByEmpNo(empNo);
	}

	@Override
	public List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo) {
		return zengtrFlexibleReimbursementReadMapper.queryEmpInsuInfo(empNo);
	}


}
