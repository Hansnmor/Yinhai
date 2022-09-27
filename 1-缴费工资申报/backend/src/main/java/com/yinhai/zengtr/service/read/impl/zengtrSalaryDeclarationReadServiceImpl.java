package com.yinhai.zengtr.service.read.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.service.read.zengtrSalaryDeclarationReadService;
import com.yinhai.zengtr.vo.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@NoTransactional
public class zengtrSalaryDeclarationReadServiceImpl extends BaseRestService implements zengtrSalaryDeclarationReadService {
	@Resource
	private com.yinhai.zengtr.mapper.read.zengtrSalaryDeclarationReadMapper zengtrSalaryDeclarationReadMapper;

	@Override
	public List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo) {
		return zengtrSalaryDeclarationReadMapper.queryEmpInfo(empNo);
	}

	@Override
	public List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo) {
		return zengtrSalaryDeclarationReadMapper.queryEmpInsuInfo(empNo);
	}

	@Override
	public List<PsnNormalInfoQueryVo> queryPsnInsuInfo(String empNo) {
//		//根据单位名称，查询单位里正常缴费的人员信息
//		List<PsnInsuDQueryVo> psnInsuDQueryVoList= zengtrSalaryDeclarationReadMapper.queryNormalPsnNo(empNo);
//		System.out.println("查询到的正常参保的人员信息"+psnInsuDQueryVoList);
////		return zengtrSalaryDeclarationReadMapper.queryPsnInsuInfo(empNo);
//		List<String> psnNos=new ArrayList<>();
//		for (PsnInsuDQueryVo psnInsuDQueryVo : psnInsuDQueryVoList) {
//			psnNos.add(psnInsuDQueryVo.getPsnNo());
//		}
//		List<PsnInfoBQueryVo> psnInfoBQueryVoList= zengtrSalaryDeclarationReadMapper.queryPsnInfoByPsnNo(psnNos);
//		System.out.println("查询到的个人信息："+psnInfoBQueryVoList);
//		return null;
		return zengtrSalaryDeclarationReadMapper.queryPsnInsuInfo(empNo);
	}

	@Override
	public List<PsnInfoBQueryVo> queryPsnInfo(String psnNo) {
		return zengtrSalaryDeclarationReadMapper.queryPsnInfo(psnNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo) {
		return zengtrSalaryDeclarationReadMapper.queryPsnInsuInfoByPsnNo(psnNo);
	}

	@Override
	public List<PsnInsuDQueryVo> queryPsnInsuIfNormal(String psnNo,String insutype) {
		return zengtrSalaryDeclarationReadMapper.queryPsnInsuIfNormal(psnNo,insutype);
	}
}
